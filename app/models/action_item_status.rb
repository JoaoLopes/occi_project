class ActionItemStatus < ActiveRecord::Base
  
  has_many :action_items
  
  validates_uniqueness_of :name
  
end
