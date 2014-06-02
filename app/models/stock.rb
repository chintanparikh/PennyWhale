require 'csv'
require 'open-uri'
require 'nokogiri'
require 'rss'

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

	def ticker
		@ticker
	end

	def self.get_news tickers
		ticker_string = tickers.join(",")
		endpoint = "http://feeds.finance.yahoo.com/rss/2.0/headline?s=" + ticker_string + "&region=US&lang=en-US"
		news = []
		
		feed = RSS::Parser.parse(open(endpoint))

		feed.items.each do |item|
			news.push({title: item.title, link: item.link})
	  end

		news
	end

	def realtime_pull_from_yahoo realtime_tag, nonrealtime_tag
		if markets_open?
			ret = pull_from_yahoo(realtime_tag)	
		else
			ret = pull_from_yahoo(nonrealtime_tag)
		end
		ret
	end
end