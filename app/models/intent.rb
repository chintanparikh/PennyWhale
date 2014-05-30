class Intent < ActiveRecord::Base
	has_many :phrases

	def execute binding
		eval(code, binding)
	end
end
