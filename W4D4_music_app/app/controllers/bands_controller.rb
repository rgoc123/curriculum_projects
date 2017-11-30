class BandsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @bands = Band.all
  end

  def new
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to bands_url
    else
      flash[:errors] = band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def show
    @band = Band.find_by(id: params[:id])
    @albums = @band.albums
  end

  def update
    band = Band.find_by(id: params[:id])
    if band.update_attributes(band_params)
      redirect_to band_url(band)
    else
      flash[:errors] = band.errors.full_messages
      redirect_to edit_band_url(band)
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.destroy
    flash[:success] = "#{band.name} has been removed"
    redirect_to bands_url
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
