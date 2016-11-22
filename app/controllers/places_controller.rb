class PlacesController < ApplicationController

  before_action :set_place, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    #place_ids = []
    #current_user.bookings.each { |booking| place_ids << booking.place_id }
    #@places = Place.where(id: place_ids)
    @places = Place.all
    @my_bookings = User.joins(bookings: :place).where(users: {id: current_user.id}).select("users.email, bookings.start_date, bookings.end_date, places.name, places.address, places.capacity, places.price")
    #User.joins(bookings: :place).where(users: {id: denis.id}).select("users.email, bookings.start_date, bookings.end_date, places.name, places.address, places.capacity, places.price")
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
