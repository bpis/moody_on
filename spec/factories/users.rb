# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
 
 
  # factory :profile do |profile| 
    # profile.fname "Test"
    # profile.lname "User"
    # profile.address_line_1 "123 Test St"
    # profile.address_line_2 "123 Test St"
    # profile.gender "Male"
    # profile.date_of_birth "14/10/1989"
    # profile.marital_status "Single"
    # profile.city "Nagpur"
    # profile.state "Maharashtra"
    # profile.country "India"
    # profile.pincode "123456"
    # profile.mobile_no "1234567891"
    # profile.org_name "Bpsi"
    # profile.designation "Developer"
    # profile.profession "Engineer"
  # end
end 