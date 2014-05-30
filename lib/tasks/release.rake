
task :release => [:environment] do 
    albums = Album.all
    albums.each do |album|
      if album.releaseDate < (Time.now + 604800)
        album.band.users.each do |user|
          AlbumMailer.status_email(user).deliver
        end
      end
    end
end

