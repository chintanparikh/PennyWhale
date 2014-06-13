class FlashHash
  def [](k)
    unless @flash["#{k}_array"].nil? or @flash["#{k}_array"].empty?
      return [@flashes[k.to_s]] + @flash["#{k}_array"]
    else
      return @flashes[k.to_s]
    end
  end
end