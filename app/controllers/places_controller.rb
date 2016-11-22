class PlacesController < ApplicationController

  def index
    
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :capacity, :price)
  end
end
