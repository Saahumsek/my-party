class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = params[:user_id]
    @booking.place_id = params[:place_id]
    @booking.save
    redirect_to place_path(Place.find(params[:place_id]))
  end

  def my_bookings
    @my_bookings = User.joins(bookings: :place).where(users: {id: current_user.id}).select("users.email, bookings.start_date, bookings.end_date, places.name, places.address, places.capacity, places.price")
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
