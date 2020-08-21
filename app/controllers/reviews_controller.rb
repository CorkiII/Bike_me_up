class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    @review.bike = @booking.bike
    authorize @review
  end

  def create
    @review = Review.new(review_params[:id])
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to bike_path(@bike)
    else
      render :show
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :bike_id)
  end
end
