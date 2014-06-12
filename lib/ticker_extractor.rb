class TickerExtractor

  def initialize regex
    @regex = regex
  end

  def run query
    query.scan(@regex).flatten
  end
end