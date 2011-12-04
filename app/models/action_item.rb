class ActionItem < ActiveRecord::Base
  
  belongs_to :topic
  belongs_to :status
  belongs_to :user
  
end
