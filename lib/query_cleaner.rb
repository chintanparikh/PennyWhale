class QueryCleaner
  def run query
    query.gsub("'", '').gsub('"', '')
  end
end