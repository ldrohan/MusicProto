class AlbumMailer < ActionMailer::Base
 before_action :authenticate_user!
  default from: ENV['EMAIL_FROM_ADDRESS']
  
  def album_email
    band_ids = current_user.bands.map(&:id)
    @albums = Album.where(band_id: band_ids)

  
  	mail(to:"drohanluke@gmail.com",subject:"Album releases",body:"Dees is an email with yo sheeit.")
  	
  	end
  end	

end
