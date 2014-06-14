class Log < ActiveRecord::Base
  belongs_to :intent
  belongs_to :user 
  belongs_to :phrase
end
