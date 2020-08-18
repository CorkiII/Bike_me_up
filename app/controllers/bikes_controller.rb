class BikesController < ApplicationController
  before_action :find_bike, only: [:show, :edit, :update, :destroy]

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def index
    @bikes = Bike.all
  end

  def show
  end

  def destroy
    @bike.destroy
  end

  def edit
  end

  def update
    @bike.update(bike_params)

    redirect_to bike_path(@bike)
  end

  private

  def bike_params
    params.require(:bike).permit(:model, :address, :gender, :color, :gear, :description, :price, :style, :photos)
  end

  def find_bike
    @bike = Bike.find(params[:id])
  end
end
