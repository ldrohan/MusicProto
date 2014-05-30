class AlbumMailer < ActionMailer::Base

  default from: ENV['EMAIL_FROM_ADDRESS']
  
  def album_email(name,releaseDate)
    # band_ids = current_user.bands.map(&:id)
    # @albums = Album.where(band_id: band_ids)
    
  
  	mail(to:"drohanluke@gmail.com",subject:name,body:releaseDate)
  	
  	
  end	

end
