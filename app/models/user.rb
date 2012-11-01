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
  
  has_one :profile
  after_create :create_user_profile
  
  
  
 
 
  def check_profile?(user)
    profile = Profile.where(['user_id=?', user.id])
    # debugger
    
    if  profile.nil?
      return true
    end

    if profile.present?
    !profile.address_line_1.present? #||
    # profile.address_line_2.present? ||
    # profile.city.present? ||
    # profile.country.present? ||
    # profile.date_of_birth.present? ||
    # profile.designation.present? ||
    # profile.fname.present? ||
    # profile.gender.present? ||
    # profile.lname.present? ||
    # profile.marital_status.present? ||
    # profile.mobile_no.present? ||
    # profile.org_name.present? ||
    # profile.pincode.present? ||
    # profile.profession.present? ||
    # profile.state.present? ||
    # profile.user_id.present? ||
    # profile.profile_picture.present?
    end
    profile
  end
  
  private
  
  def create_user_profile
    
    @profile = self.create_profile
   #self.build_profile
  end  
  
end
