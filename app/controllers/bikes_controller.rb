class BikesController < ApplicationController
  before_action :find_bike, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    if params[:query].present?
      @bikes = policy_scope(Bike).search_by_address(params[:query]).geocoded
      @markers = @bikes.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { bike: bike }),
          image_url: helpers.asset_url('bike')
        }
      end
    else
      @bikes = policy_scope(Bike).geocoded
      @markers = @bikes.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { bike: bike }),
          image_url: helpers.asset_url('bike')
        }
      end
    end
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
    authorize @bike
  end

  def destroy
    @bike = Bike.find(params[:id])
    authorize @bike
    @bike.destroy
    redirect_to bikes_path
  end

  def edit
  end

  def update
    @bike.update(bike_params)

    redirect_to bike_path(@bike)
  end

  private

  def bike_params
    params.require(:bike).permit(:model, :address, :gender, :color, :gear, :description, :price, :style, photos: [])
  end

  def find_bike
    @bike = Bike.find(params[:id])
  end
end
