FactoryGirl.define do

  sequence :email do |n|
    "test#{n}@example.com"
  end
  
  factory :user do
    first_name "Ma"
    last_name "Pa"
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    phone "12345678"
    ssn 1234
    company "ABC company"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "User"
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    phone "12345678"
    ssn 1234
    company "ABC company"
  end

  factory :non_authorized_user, class: "User" do
    first_name "Non"
    last_name "Authorized"
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    phone "12345678"
    ssn 1234
    company "ABC company"
  end

end