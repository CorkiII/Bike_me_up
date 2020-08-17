class BikesController < ApplicationController
  before_action :find_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.all
  end

  def show
  end

  def edit
  end

  def update
    @bike.update(bike_params)

    redirect_to bike_path(@bike)
  end

  private

  def find_bike
    @bike = Bike.find(params[:id])
  end
end
