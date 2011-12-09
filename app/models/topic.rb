class Topic < ActiveRecord::Base
  
  has_many :action_items, :dependent => :destroy
  belongs_to :meeting
  
end
