class BikesController < ApplicationController
  before_action :find_bike, only: [:show, :destroy]

  def index
    @bikes = Bike.all
  end

  def show
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to bike_path(@bike)
  end

  private

  def find_bike
    @bike = Bike.find(params[:id])
  end
end
