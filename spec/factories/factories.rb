FactoryGirl.define do
 sequence :email do |n|
    "lalalala#{n}@luke.com"
  end

  factory :user do
  	name "Luke"
  	email
  	password "password"
  	password_confirmation "password"
  end




  factory :album do

  end




  factory :band do
  end

end