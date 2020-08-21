class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @review = Review.find(params[:bike_id])
    @review = Review.new
    authorize @booking
  end

  def create
    @review = Review.new(bike_params[:bike_id])
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to bike_path(@bike)
    else
      render
    end

    private

  def review_params
    params.require(:review).permit(:content, :bike_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
