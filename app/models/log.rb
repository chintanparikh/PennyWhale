class Log < ActiveRecord::Base
  has_one :intent, :user, :phrase
end
