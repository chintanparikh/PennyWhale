class Intent < ActiveRecord::Base
	has_many :phrases

	def get_data binding
		eval(code, binding)
	end
	
end
