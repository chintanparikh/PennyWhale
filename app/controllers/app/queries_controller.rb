class App::QueriesController < App::BaseController
	include App::QueriesHelper

	def index
	end

	def execute
		stocks = params[:query].scan(/\$([a-zA-Z.]+)/).flatten.map{|stock| Stock.find(stock)}

		if stocks.empty?
			flash.now[:danger] = "No stock tickers entered." 
			return false
		end

		query = params[:query].gsub("'", '').gsub('"', '')

		like = (Rails.env.production? or Rails.env.staging?) ? "ILIKE" : "LIKE"

		phrases = Phrase.where("'#{query}' #{like} '%' ||  phrase || '%'").order("LENGTH(phrase) ASC")
		phrases = phrases.sort{|a, b| string_distance(query, a.phrase) <=> string_distance(query, b.phrase)}
		phrase = phrases[0]

		if phrase.nil?
			flash.now[:warning] = "Invalid query"
			return false
		end

		# Check if phrase isn't found
		@intent = phrase.intent
		
		@output = stocks.map do |stock|
			{ticker: stock.ticker, data: @intent.get_data(stock.get_binding)}
		end

		@news = Stock.get_news stocks.map{|stock| stock.ticker}

	end

	def autocomplete
		# LIKE is case insensitive in sqlite (testing, develop), but not in postgres (staging, production), so we need ILIKE for those cases
		like = (Rails.env.production? or Rails.env.staging?) ? "ILIKE" : "LIKE"
		@suggestions = []
		length = params[:query].split(' ').count

		0.upto(length - 1).each do |i|
			if @suggestions.empty?
				@suggestions += Phrase.select([:phrase])
															.where("phrase #{like} ?", "%#{params[:query].split(' ')[i..length].join(' ')}%")
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
	end

end
