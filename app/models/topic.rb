class Topic < ActiveRecord::Base
  
  has_many :action_items
  belongs_to :meeting
  
end
