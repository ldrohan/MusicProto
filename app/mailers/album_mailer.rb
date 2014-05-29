class AlbumMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']
  
  def status_email()
    band_ids = current_user.bands.map(&:id)
    @albums = Album.where(band_id: band_ids)
  	mail(to:"smtp.gmail.com",subject:"Album releases",body:"Here are upcoming album releases for the artists you follow!")
  end	

end
