describe Album do

  describe 'name' do
		it 'should not be empty' do
      album = FactoryGirl.build(:album)
      album.should be_valid
    end
  end
  
  describe 'releaseDate' do
    it 'should have a release date' do
      album2 = FactoryGirl.build(:album, releaseDate: "2011-07-02T08:00:00Z")
      album2.should be_valid
    end
  end

  describe 'bandID' do
  	it 'should have a band_id' do
  		album3 = FactoryGirl.build(:album, band_id: 33)
  		album3.should be_valid
 		 end	
	end

end
