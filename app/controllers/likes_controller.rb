class LikesController < ApplicationController

  def index
    @spots = []
    Spot.all.each do |spot|
      spot.likes.each do |like|
        if like.user_id == current_user.id
          @spots << spot
          @spots = @spots.uniq
        end
      end
    end

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { spot: spot }),
        spotId: spot.id
      }
    end
  end

  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @like.save! if Like.find_by(user: current_user, spot: @like.spot).nil?
    render json: { success: true, like_id: @like.id}
    # if params[:whereami] == "spots"
    #   redirect_to spots_path
    # elsif params[:whereami] == "likes"
    #   redirect_to likes_path
    # end

  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: { success: true}
    # if params[:whereami] == "spots"
    #   redirect_to spots_path
    # elsif params[:whereami] == "likes"
    #   redirect_to likes_path
    # end
  end

  def like_params
    params.permit(:spot_id, :latitude, :longitude, :name, :description, photos: [])
    params.require(:like).permit(:spot_id)
  end
end
