class BandsController < ApplicationController
  def index
    @bands = Band.all
    respond_to do |format|
    	format.html
      format.json {render :json => @bands, :only => [:name]}
    end
    @band = Band.new
    results = Typhoeus.get("https://itunes.apple.com/search?term=weezer&entity=album")
    @band_info = JSON.parse(results.body)
    
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    respond_to do |format|
      if @band.save
        format.json { render json: @band, status: :created }
      else
        format.json { render json: @band.errors, status: :unprocessable_entity}
      end
    end
  end
    private
    def band_params
      params.require(:band).permit(:name)
    end
  end
