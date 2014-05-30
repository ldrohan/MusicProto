class AlbumMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']
  
  def album_email()
    band_ids = current_user.bands.map(&:id)
    @albums = Album.where(band_id: band_ids)

    @albums.each do |i|
  	mail(to:"drohanluke@gmail.com",subject:"Album releases",body:"#{i["name"]}")
  	puts i["name"]
  	end
  end	

end
