class UserSubmood < ActiveRecord::Base
  attr_accessible :submood_id, :user_id
  
  belongs_to :user
  belongs_to :sub_mood
end
