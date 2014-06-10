require 'csv'
require 'open-uri'

module Yahoo
  # Tags is an array of tags for the Yahoo API
  def self.get_fundamentals ticker, tags
    endpoint = "http://download.finance.yahoo.com/d/quotes.csv?s=#{ticker}&f=#{tags.join(',')}"
    data = CSV.parse(open(endpoint))
    # output array looks like  [['val1', 'TICKER', 'val2', 'TICKER', 'val3']]. We need to remove the tickers
    data[0].reject{|e| data[0].find_index(e) % 2 != 0}
  end

  # Should be two tags - one for the real value, one for the percentage change
  def self.get_percent_change ticker, tags
    data = Yahoo.get_fundamentals(ticker, tags)
    "#{data[0]} + #{data[2]}"
  end

  def self.key_statistic ticker, stat
    endpoint = "http://www.kimonolabs.com/api/6h5bewws?apikey=dc1715b533f396e15a4a43914c9c901f&s=#{ticker}"
    
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
    keys = new_results.map {|elem| elem.keys[0].gsub(/\(.*\)/, "")}
    shortest = keys.min_by(&:length)
    new_results.map! {|r| {r.keys[0].gsub(/\(.*\)/, "") => r.to_a[0][1]}}
    new_results.each {|res| return res[shortest] if res.keys[0].eql? shortest}
  end
end