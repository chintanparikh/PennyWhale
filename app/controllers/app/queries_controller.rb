class App::QueriesController < App::BaseController

	def index
	end

	def execute
		phrase = Phrase.find_by_phrase(params[:query])
		# Check if phrase isn't found
		@intent = phrase.intent

		stocks = params[:tickers].split.map{|stock| Stock.find(stock)}
		
		@output = stocks.map do |stock|
			{ticker: stock.ticker, data: @intent.get_data(stock.get_binding)}
		end	
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
