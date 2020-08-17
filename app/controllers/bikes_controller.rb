class BikesController < ApplicationController
  before_action :find_bike, only: [:show, :destroy]

  def index
    @bikes = Bike.all
  end

  def show
  end

  private

  def find_bike
    @bike = Bike.find(params[:id])
  end
end
