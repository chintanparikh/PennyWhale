class App::QueriesController < App::BaseController

	def index
	end

	# params[:ticker]
	# params[:query]
	def execute
		stock = Stock.find(params[:ticker])
		phrase = Phrase.find_by_phrase(params[:query])
		intent = phrase.intent
		binding = stock.get_binding
		@output = eval(intent.code, binding)
	end

	def autocomplete
		@suggestions = Phrase.select([:phrase]).where("phrase LIKE ?", "%#{params[:query]}%").order("LENGTH(phrase) ASC").map{|p| p.phrase}
		@resp = {suggestions: @suggestions}
		respond_to do |format|
			format.json {render json: @resp}
		end
	end

end
