class AlbumsController < ApplicationController
  def new
  end

  def create
  	#@albums = Album.all
    @album = Album.create(album_params)

    respond_to do |format|
      if @album.save
        format.json { render json: @album, status: :created }
      else
        format.json { render json: @album.errors, status: :unprocessable_entity}
      end
    end
  end
  private
  def album_params
    params.require(:album).permit(:name, :releaseDate, :band_id)
  end
end
