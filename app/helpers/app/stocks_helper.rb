module App::StocksHelper
	def markets_open?
		now = Time.now
		open = Time.new(now.year, now.month, now.day, 9, 30, 0)
		close  = Time.new(now.year, now.month, now.day, 16, 0, 0)

		return now.between?(open, close)
	end
end