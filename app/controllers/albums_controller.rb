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

  def recent_albums
    @albums = Album.all
    @albumshash=[]
    @albums.each do |i|
      if (i["releaseDate"] > 1.month.ago) && (i["releaseDate"] < Time.now)
        @albumshash.push(i["name"] + "; " + i["releaseDate"])
      end
    end
    respond_to do |format|
      format.json { render json: @albumshash, status: :ok }
    end
  end


  def album_release
    #this method will iterate through release Dates and start the sidekiq worker.
    @albums = Album.all
    @albums.each do |i|
      if i["releaseDate"] > Time.now
        AlbumMailer.status_email
        #puts i["name"]
        #puts i["releaseDate"]
      end
    end
  end
  private
  def album_params
    params.require(:album).permit(:name, :releaseDate, :band_id)
  end
end
