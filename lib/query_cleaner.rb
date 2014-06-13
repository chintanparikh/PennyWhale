class QueryCleaner
  def run query
    @query = query.gsub("'", '').gsub('"', '')
    @errors = []
    @warnings = []
    
    unless has_tickers(query)
      @errors.push("No tickers entered - use $ to enter a ticker. E.g. Show me the PE ratio for $AAPL.")
    end
    return @query, @errors, @warnings
  end

  def has_tickers query
    query.include?("$")
  end
end