class AlbumsController < ApplicationController
  def new
    @bands = Band.all
    @band = Band.find_by(id: params[:band_id])
  end

  def create
    album = Album.new(album_params)
    band = Band.find_by(id: album_params[:band_id].to_i)
    if album.save
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      redirect_to new_band_album_url(band)
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
  end

  def edit
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
  end

  def update
    album = Album.find_by(id: params[:id].to_i)
    band = Band.find_by(id: album.band_id)
    if album.update_attributes(album_params)
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      redirect_to edit_album_url(album)
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    band = Band.find_by(id: album.band_id)
    if album.destroy
      redirect_to band_url(band)
    else
      flash[:errors] = 'Album cannot be found'
      redirect_to band_urls
    end
  end

  def album_params
    params.require(:album).permit(:band_id, :title, :yr, :studio)
  end
end
