class App::QueriesController < App::BaseController

	def index
	end

	# params[:ticker]
	# params[:query]
	def execute
		stock = Stock.find(params[:ticker])
		# Check if stock isn't valid
		phrase = Phrase.find_by_phrase(params[:query])
		# Check if phrase isn't found
		intent = phrase.intent
		# @output = intent.execute stock.get_binding
		@output = 5
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
