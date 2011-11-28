class Meeting < ActiveRecord::Base
  
  has_many :meeting_people
  has_many :topics
  
end
