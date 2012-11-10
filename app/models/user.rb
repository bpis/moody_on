class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_one :profile, :dependent => :destroy
  after_create :create_user_profile
  
  has_many :user_submoods
  
 
 
 def mood_according_city(city)
  #users = UserSubmood.joins(:sub_mood).joins(:user => :profile).where(:profiles => {:city => city})
  #users = User.find_by_sql(["SELECT user_submoods.user_id, user_submoods.sub_mood_id, moods.name, profiles.city FROM (user_submoods INNER JOIN sub_moods ON sub_moods.id = user_submoods.sub_mood_id INNER JOIN moods ON moods.id = sub_moods.mood_id INNER JOIN profiles ON profiles.user_id = user_submoods.user_id) WHERE profiles.city = 'Nagpur' ORDER BY moods.name"])
  users = UserSubmood.joins(:sub_mood => :mood).joins(:user => :profile).where(:profiles => {:city => city}).select("user_submoods.user_id, user_submoods.sub_mood_id, moods.name, profiles.city")
  #usb.uniq!
 end
  
  
  
  private
  
  def create_user_profile
    
    @profile = self.create_profile
   #self.build_profile
  end  
  
end
