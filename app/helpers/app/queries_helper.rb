module App::QueriesHelper
  def remaining_queries
    10 - cookies[:queries].to_i
  end
end
