class StockExtractor

  def initialize regex
    @regex = regex
  end

  def run query
    query.scan(@regex).flatten.map{|stock| Stock.find(stock)}
  end
end