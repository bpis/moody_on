module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
   def check_profile(current_user)
    current_user.profile.address_line_1.present? &&
    current_user.profile.address_line_2.present? &&
    current_user.profile.city.present? &&
    current_user.profile.country.present? &&
    current_user.profile.date_of_birth.present? &&
    current_user.profile.designation.present? &&
    current_user.profile.fname.present? &&
    current_user.profile.gender.present? &&
    current_user.profile.lname.present? &&
    current_user.profile.marital_status.present? &&
    current_user.profile.mobile_no.present? &&
    current_user.profile.org_name.present? &&
    current_user.profile.pincode.present? &&
    current_user.profile.profession.present? &&
    current_user.profile.state.present? &&
    current_user.profile.user_id.present? &&
    current_user.profile.profile_picture.present? 
  end
end
