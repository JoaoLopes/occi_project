class Topic < ActiveRecord::Base
  
  has_many :action_items, :dependent => :destroy
  belongs_to :meeting
  
  accepts_nested_attributes_for :topics, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
end
