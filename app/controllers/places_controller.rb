class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    #place_ids = []
    #current_user.bookings.each { |booking| place_ids << booking.place_id }
    #@places = Place.where(id: place_ids)
    @places = Place.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # karr comment : marker.infowindow render_to_string(partial: "/places/map_box", locals: { place: place })
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
