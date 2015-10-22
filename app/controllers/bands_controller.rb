class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      render :show # change this later
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def update
    @band = band.find(params[:id])
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update

  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end