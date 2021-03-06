class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def dashboard
    @user = current_user
    @myplaces = @user.places

    owner_places_ids = @myplaces.map do |place|
      place.id
    end

    @bookings = []
    Booking.all.each do |booking|
      if owner_places_ids.include?(booking.place.id)
        @bookings << booking
      end
    end

    #@mybookings = User.joins(bookings: :place).where(users: {id: current_user.id}).select("users.email, bookings.status, bookings.start_date, bookings.end_date, places.name, places.address, places.capacity, places.price")
    @mybookings = @user.bookings


  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.user_id = current_user.id
    @booking.place_id = params[:place_id]
    @booking.save
    flash[:notice] = "Booking request sent to place owner"
    redirect_to place_path(Place.find(params[:place_id]))
  end

  #def my_bookings
  #  @my_bookings = User.joins(bookings: :place).where(users: {id: current_user.id}).select("users.email, bookings.status, bookings.start_date, bookings.end_date, places.name, places.address, places.capacity, places.price")
  #end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def rejected
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment)
  end
end
