class PhraseExtractor

  def initialize string_distance_algorithm = LevenshteinDistance.new
    @string_distance_algorithm = string_distance_algorithm
  end

  def run query
    like = (Rails.env.production? or Rails.env.staging?) ? "ILIKE" : "LIKE"

    phrases = Phrase.where("'#{query}' #{like} '%' ||  phrase || '%'").order("LENGTH(phrase) ASC")
    phrases = phrases.sort{|a, b| @string_distance_algorithm.run(query, a.phrase) <=> @string_distance_algorithm.run(query, b.phrase)}
    phrase = phrases[0]
  end
end