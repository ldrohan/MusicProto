class AlbumMailer < ActionMailer::Base

  default from: ENV['EMAIL_FROM_ADDRESS']
  

  def album_email(email,name,releaseDate)
    # band_ids = current_user.bands.map(&:id)
    # @albums = Album.where(band_id: band_ids)
    
  
  	mail(to:email,subject:name,body:releaseDate)
  end
  	

  def status_email(user)
  	mail(to: user.email,subject:"Album releases",body:"Here are upcoming album releases for the artists you follow!")
  end	

end
