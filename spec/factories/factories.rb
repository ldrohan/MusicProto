FactoryGirl.define do
 sequence :email do |n|
    "lalalala#{n}@luke.com"
  end

  factory :user do
		email
  	password "password"
  	password_confirmation "password"
  end




  factory :band do
  	name "AWESOMEBAND"
  	user_id 1
  end




  factory :album do
  end

end