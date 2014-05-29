require 'spec_helper'

describe User do

	describe 'email' do

		it 'should not be empty' do
      user = FactoryGirl.build(:user, email: nil)
      user.should_not be_valid
    end  
  	it 'should be formatted correctly' do
  		user2 = FactoryGirl.build(:user, email: "fake_email")
  		user2.should_not be_valid
  	end

  end
  	
  describe 'uniqueness' do
   	it 'should be unique' do
      user_1 = FactoryGirl.create(:user)
      user_2 = FactoryGirl.build(:user, email: user_1.email)
      user_2.should_not be_valid
      end
    end	

end
