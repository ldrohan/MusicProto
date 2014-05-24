class BandsController < ApplicationController
  def index
    @bands = Band.all
    #results = Typhoeus.get("https://itunes.apple.com/search?term=weezer&entity=album")
    #@body = JSON.parse(results.body)
    #binding.pry
    respond_to do |format|
    	format.html #{render :html => @body }
      format.json {render :json => @bands, :only => [:name]}
    end
    @band = Band.new
    #binding.pry
  end

  def create
    @band = Band.create(band_params)
    #binding.pry
    respond_to do |format|
      if @band.save
        format.json { render json: @band, status: :created }
      else
        format.json { render json: @band.errors, status: :unprocessable_entity}
      end
    end
  #   results = Typhoeus.get("https://itunes.apple.com/search?term=weezer&entity=album")
  #   @body = JSON.parse(results.body)
    end
    private
    def band_params
      params.require(:band).permit(:name)
    end
  end
