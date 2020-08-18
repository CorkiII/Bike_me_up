class BookingsController < ApplicationController
  def new
    @reservation = Reservation.new
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

  private

  def bike_params
    params.require(:bike).permit(:model, :user_id, :address, :gender, :color, :gear, :description, :style, :price)
  end
end
