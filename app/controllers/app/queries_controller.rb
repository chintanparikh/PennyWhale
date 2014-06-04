class App::QueriesController < App::BaseController
	include App::QueriesHelper

	def index
	end

	def execute
		stocks = params[:query].scan(/\$([a-zA-Z.]+)/).flatten.map{|stock| Stock.find(stock)}

		params[:query].gsub!("'", '').gsub!('"', '')

		phrases = Phrase.where("'#{params[:query]}' LIKE '%' ||  phrase || '%'").order("LENGTH(phrase) ASC")
		phrases = phrases.sort{|a, b| string_distance(params[:query], a.phrase) <=> string_distance(params[:query], b.phrase)}
		phrase = phrases[0]	

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
		@suggestions = Phrase.select([:phrase]).where("phrase #{like} ?", "%#{params[:query]}%").order("LENGTH(phrase) ASC").map{|p| p.phrase}
		
		@resp = {suggestions: @suggestions}

		respond_to do |format|
			format.json {render json: @resp}
		end
	end

end
