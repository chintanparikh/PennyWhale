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
		endpoint = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@ticker}&f=#{tag}"
		data = CSV.parse(open(endpoint))
		data[0][0]
	end

	def percent_change_yahoo tag_value, tag_percent
		endpoint = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@ticker}&f=#{tag_value},#{tag_percent}"
		data = CSV.parse(open(endpoint))
		data[0][0]+"(#{data[0][2]})"
	end

	def yahoo_key_stats stat
		endpoint = "http://www.kimonolabs.com/api/6h5bewws?apikey=dc1715b533f396e15a4a43914c9c901f&s=#{@ticker}"
		
		begin 
			response = RestClient.get(endpoint)
		rescue 
			#try again 
			response = RestClient.get(endpoint)
		end

		parsed = JSON.parse(response)
		results = parsed['results']['collection1'].map{|elem| {elem['property_name'] => elem['property_value']}}
		new_results = results.reject {|result| !result.keys[0].downcase.include? stat}

		keys = [] 
		new_results.each {|elem| keys.push(elem.keys[0])}
		shortest = keys.min_by(&:length)
		new_results.each {|res| return res[shortest] if res.keys[0].eql? shortest}
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

	def whalewisdom_stock_id
		url = "http://whalewisdom.com/stock/#{@ticker}"
		text = open(url).read
		/^\s+whalewisdom.Stock.stock_id=([0-9]+)/.match(text)[1]
	end

	def whalewisdom_quarter_id
		url = "http://whalewisdom.com/stock/#{@ticker}"
		text = open(url).read
		/^\s+whalewisdom.Stock.current_quarter_id=([0-9]+)/.match(text)[1]
	end

	def dataroma_holdings
		endpoint = "http://www.dataroma.com/m/m_activity.php?m=#{@ticker}&typ=a"
		doc = Nokogiri::HTML(open(endpoint))

		table = doc.find('#grid')

		table
	end
	
end