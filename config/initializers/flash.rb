# Monkey patch flash messages to turn them into arrays
class ActionDispatch::Flash::FlashHash
  def [](k)
    @flashes[k.to_s] ||= []
    if @flashes[k.to_s].empty?
      return nil
    elsif @flashes[k.to_s].size == 1
      return @flashes[k.to_s][0]
    else
      return @flashes[k.to_s]
    end
  end

  def [](k, v)
    @flashes[k.to_s] ||= []
    @flashes[k.to_s] << v
  end
end