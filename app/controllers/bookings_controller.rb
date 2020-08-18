class BookingsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @bike = Bike.find(bike_params)
    @reservation = Reservation.new(reservation_params)
    @reservation.bike = @reservation
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bike_path(@bike)
  end

  private

  def bike_params
    params.require(:bike).permit(:model, :user_id, :address, :gender, :color, :gear, :description, :style, :price)
  end

  def find_booking
    @booking = booking.find(params[:id])
  end
end
