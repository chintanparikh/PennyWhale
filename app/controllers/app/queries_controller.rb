class App::QueriesController < App::BaseController
	include App::QueriesHelper

	def index
	end

	def execute
		query = QueryCleaner.new.run(params[:query])
		log = Log.create(query: query)
		log.update_attributes(user_id: current_user.id) unless current_user.nil?

		tickers = TickerExtractor.new(/\$([a-zA-Z.]+)/).run(query)
		log.update_attributes(tickers: tickers)

		stocks = tickers.map{|ticker| Stock.find(ticker)}

		if stocks.empty?
			flash.now[:danger] = "No stock tickers entered." 
			return false
		end

		phrase = PhraseExtractor.new(LevenshteinDistance.new).run(query)

		if phrase.nil?
			flash.now[:warning] = "Invalid query"
			return false
		end

		@intent = phrase.intent
		log.update_attributes(phrase_id: phrase.id, intent_id: @intent.id)

		authorize! :execute, @intent
		
		@output = stocks.map do |stock|
			{ticker: stock.ticker, data: @intent.get_data(stock.get_binding)}
		end

		@news = Stock.get_news stocks.map{|stock| stock.ticker}
	end

	def autocomplete
		# LIKE is case insensitive in sqlite (testing, develop), but not in postgres (staging, production), so we need ILIKE for those cases
		@suggestions = []
		length = params[:query].split(' ').count

		0.upto(length - 1).each do |i|
			if @suggestions.empty?
				@suggestions += Phrase.select([:phrase])
															.where("phrase ILIKE ?", "%#{params[:query].split(' ')[i..length].join(' ')}%")
															.order("LENGTH(phrase) ASC")
															.map{|p| {input: params[:query], phrase: params[:query].reverse.sub(params[:query].split(' ')[i..length].join(' ').reverse, p.phrase.reverse).reverse}}
			end		
		end

		@resp = {suggestions: @suggestions}

		respond_to do |format|
			format.json {render json: @resp}
		end
	end

	def help
		@intents = Intent.select(:name).map{|i| i.name}
	end

end
