class ActionItem < ActiveRecord::Base
  
  belongs_to :topic
  belongs_to :status
  belongs_to :user
  belongs_to :action_item_status
  
end
