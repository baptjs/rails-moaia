class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.spot = @spot
    if @review.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:date, :content, :tips, :rating)
  end

end
