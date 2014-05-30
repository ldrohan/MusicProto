
task :release => [:environment] do 
    albums = Album.all
    albums.each do |album|
      if album.releaseDate < (Time.now + 604800)
        user_album = album.band.user 
        AlbumMailer.status_email(user_album).deliver
      end
    end
end

