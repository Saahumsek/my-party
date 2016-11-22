class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  def destroy

  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :address, :capacity, :price)
  end
end
