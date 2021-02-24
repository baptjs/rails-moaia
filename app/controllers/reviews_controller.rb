class ReviewsController < ApplicationController

  def show
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end

  def create
  @review = Review.new(review_params)
  @review.user_id = current_user.id

    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:date , :content, :tips , rating: [])
  end

end
