class App::QueriesController < App::BaseController
	include ApplicationHelper

	after_action :log_query, only: :execute

	def index
	end

	# We create the log in log_query through an after_filter
	def execute
		@query, errors, warnings = QueryCleaner.new.run(params[:query])

		if current_user.nil?
			queries = cookies[:queries].to_i || 0
			queries = queries + 1
			queries = 10 if queries > 10
			cookies[:queries] = queries
		end

		flash_messages :query_error, errors
		return false unless errors.empty?

		flash_messages :query_warning, warnings

		@tickers = TickerExtractor.new(/\$([a-zA-Z.]+)/).run(@query)
		stocks = @tickers.map{|ticker| Stock.find(ticker)}

		@phrase = PhraseExtractor.new(LevenshteinDistance.new).run(@query)

		if @phrase.nil?
			flash_message :query_error, "Invalid query"
			return false
		end

		@intent = @phrase.intent
		authorize! :execute, @intent
		
		@output = stocks.map do |stock|
			{ticker: stock.ticker, data: @intent.get_data(stock.get_binding)}
		end

		@news = Stock.get_news stocks.map{|stock| stock.ticker}
	end

	def autocomplete
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


	private
	def log_query
		log = Log.create(
			query: @query, 
			user_id: (current_user.nil? ? nil : current_user.id),
			tickers: @tickers,
			phrase_id: @phrase,
			intent_id: @intent
			)
	end
end
