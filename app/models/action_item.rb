class ActionItem < ActiveRecord::Base
  
  belongs_to :topic
  belongs_to :status
  
end
