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

end
