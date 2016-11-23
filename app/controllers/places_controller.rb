class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    city = params["search"]["city"]
    start_date = params["search"]["start_date"]
    end_date = params["search"]["end_date"]
    if city.empty?
      @places = Place.where.not(latitude: nil, longitude: nil)
    else
      @places = Place.where(city: city).where.not(latitude: nil, longitude: nil) #.where.not("start_date")
    end
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
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
    @place = Place.find(params[:id])
    @alert_message = "You are viewing #{@place.name}"
    @place_coordinates = { lat: @place.latitude, lng: @place.longitude }
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
