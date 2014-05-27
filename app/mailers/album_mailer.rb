class AlbumMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']
  def status_email()
  	mail(to:"drohanluke@gmail.com",subject:"hi",body:"boop")
  end	
end
