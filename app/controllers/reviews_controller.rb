class ReviewsController < ApplicationController

  def show
    @spot = Spot.find(params[:spot_id])
    @review = Review.find(params[:id])
    # raise
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end

  def create

    @spot = Spot.find(params[:spot_id])
    # raise
    @review = Review.new(review_params)
    @review.user = current_user
    # spot = @spot.nil? ? spot : @spot
    @review.spot = @spot
    if @review.save
      redirect_to spot_review_path(@spot, @review)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:date, :content, :tips, :rating, photos: [], fish_ids: [])
  end

end
