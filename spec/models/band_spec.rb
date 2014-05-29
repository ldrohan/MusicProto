describe Band do

	describe 'name' do

		it 'should not be empty' do
      band = FactoryGirl.build(:band, name: nil)
      band.should_not be_valid
    end  
  	it 'should have a user ID' do
  		band2 = FactoryGirl.build(:band)
  		band2.should be_valid
  	end

  end
  

end
