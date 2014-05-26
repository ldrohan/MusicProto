class AlbumsController < ApplicationController
  def new
  end

  def create
  	#@albums = Album.all
    @album = Album.create(album_params)

    respond_to do |format|
      if @album.save
        format.json { render json: @album, status: :created }
        album_release
      else
        format.json { render json: @album.errors, status: :unprocessable_entity}
      end
    end
    
  end

  def album_release
  	@albums = Album.all
  	@albums.each do |i|
  		if i["releaseDate"] >= Time.now
  			puts "THIS IS WHERE EMAIL WOULD GO"
  		end		
  	end	
  end	
  private
  def album_params
    params.require(:album).permit(:name, :releaseDate, :band_id)
  end
end
