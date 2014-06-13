class Intent < ActiveRecord::Base
	has_many :phrases

	def get_data binding
		eval(code, binding)
	end
  
  def is_executable_by? role
    executable_by.include? role.to_s
  end	
end
