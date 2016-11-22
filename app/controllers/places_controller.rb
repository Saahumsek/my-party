class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    #@places = Place.all
    city = params["search"]["city"]
    start_date = params["search"]["start_date"]
    end_date = params["search"]["end_date"]
    @places = Place.joins(:bookings).where(places: {city: city}) #.where.not("start_date")
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
    @booking = Booking.new
    @bookings = Booking.where(place_id: @place.id)
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
    params.require(:place).permit(:name, :address, :capacity, :price, photos: [])
  end
end
