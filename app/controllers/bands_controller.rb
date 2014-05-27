class BandsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bands = Band.where(user_id: current_user)
    respond_to do |format|
      format.html #{render :html => @body }
      format.json {render :json => @bands, :only => [:id, :name]}
    end
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    @band.user_id = current_user.id
    respond_to do |format|
      if @band.save
        format.json { render json: @band, status: :created }
      else
        format.json { render json: @band.errors, status: :unprocessable_entity}
      end
    end
  end

  def delete
    @band = Band.find(params[:ajax])
    @band.destroy
    respond_to do |format|
      format.json { render json: @band, status: :ok }
    end
  end
  private
  def band_params
    params.require(:band).permit(:name)
  end
end
