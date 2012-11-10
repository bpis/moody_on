class UserSubmood < ActiveRecord::Base
  attr_accessible :sub_mood_id, :user_id
  
  belongs_to :user
  belongs_to :sub_mood
end
