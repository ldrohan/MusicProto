
task :release => [:environment] do 
    albums = Album.all
    albums.each do |album|
      if album.band.users.releaseDate < (Time.now + 604800)
        #album.users.band.each do |user|
          AlbumMailer.status_email(user).deliver
        end
      end
    end
end

