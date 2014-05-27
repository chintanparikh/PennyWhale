require 'csv'
require 'open-uri'

class Stock

	def initialize ticker
		@ticker = ticker
	end

	def self.find ticker
		Stock.new ticker
	end

	def get_binding
		return binding
	end

	def pull_from_yahoo tag
		endpoint = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@ticker}&f=#{tag}"
		data = CSV.parse(open(endpoint))
		data[0][0]
	end
end