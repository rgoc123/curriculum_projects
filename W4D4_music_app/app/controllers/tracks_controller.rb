class TracksController < ApplicationController
  before_action :authenticate_user!

  def new
    @albums = Album.all
    @album = Album.find_by(id: params[:album_id])
  end

  def create
    track = Track.new(track_params)
    album = Album.find_by(id: track_params[:album_id].to_i)

    if track.save
      redirect_to track_url(track)
    else
      flash[:errors] = track.errors.full_messages
      redirect_to new_album_track_url(album)
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    @album = Album.find_by(id: @track.album_id)
  end

  def edit
    @albums = Album.all
    @track = Track.find_by(id: params[:id])
    @album = Album.find_by(id: @track.album_id)
  end

  def update
    track = Track.find_by(id: params[:id].to_i)
    album = Album.find_by(id: track.album_id)
    if track.update_attributes(track_params)
      redirect_to track_url(track)
    else
      redirect_to edit_track_url(track)
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    album = Album.find_by(id: track.album_id)
    if track.destroy
      redirect_to album_url(album)
    else
      flash[:errors] = 'Track cannot be found'
      redirect_to album_url(album)
    end
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :lyrics)
  end
end
