require 'csv'
require 'open-uri'
require 'nokogiri'
require 'rss'
require 'json'
require 'rest_client'

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
		fundamentals = Yahoo.get_fundamentals @ticker, [tag]
		fundamentals[0]
	end

	def percent_change_yahoo tag_value, tag_percent
		Yahoo.get_percent_change @ticker, [tag_value, tag_percent]
	end

	def yahoo_key_stats stat
		Yahoo.key_statistic @ticker, stat
	end

	def ticker
		@ticker
	end

	def get_income_statement
		Financials.get_income_statement @ticker
	end

	def self.get_news tickers
		ticker_string = tickers.join(",")
		endpoint = "http://feeds.finance.yahoo.com/rss/2.0/headline?s=" + ticker_string + "&region=US&lang=en-US"
		
		feed = RSS::Parser.parse(open(endpoint))

		feed.items.map {|item| {title: item.title, link: item.link}}
	end

	def markets_open?
		now = Time.now
		open = Time.new(now.year, now.month, now.day, 9, 30, 0)
		close  = Time.new(now.year, now.month, now.day, 16, 0, 0)

		return now.between?(open, close)
	end

	def realtime_pull_from_yahoo realtime_tag, nonrealtime_tag
		if markets_open?
			ret = pull_from_yahoo(realtime_tag)	
		else
			ret = pull_from_yahoo(nonrealtime_tag)
		end
		ret
	end

	def dataroma_holdings
		endpoint = "http://www.kimonolabs.com/api/avijisro?apikey=dc1715b533f396e15a4a43914c9c901f&m=#{@ticker}"

		begin 
			response = RestClient.get(endpoint)
		rescue 
			#try again 
			response = RestClient.get(endpoint)
		end

		parsed = JSON.parse(response)
		results = parsed['results']['collection1'].reject{|elem| elem["stock"]["text"].nil?}

		p results

		results
	end


	
end