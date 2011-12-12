class Topic < ActiveRecord::Base
  
  has_many :action_items, :dependent => :destroy
  belongs_to :meeting
  
  accepts_nested_attributes_for :action_items, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
  
end
