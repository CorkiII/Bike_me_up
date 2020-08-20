class BikesController < ApplicationController
  before_action :find_bike, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    if params[:query].present?
      @bikes = policy_scope(Bike).global_search(params[:query])
    else
      @bikes = policy_scope(Bike)
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
