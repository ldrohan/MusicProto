class AlbumsController < ApplicationController
  def new
  end

  def create
  	#@albums = Album.all
    @album = Album.create(album_params)

    respond_to do |format|
      if @band.save
        format.json { render json: @band, status: :created }
      else
        format.json { render json: @band.errors, status: :unprocessable_entity}
      end
    end
  end
  private
  def album_params
    params.require(:album).permit(:name, :releaseDate, :band_id)
  end
end
