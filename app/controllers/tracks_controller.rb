class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render :index
  end

  def new
    @track = Track.new
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      render :show # change this later
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :track_name, :lyrics)
  end

end
