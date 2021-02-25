class SpotsController < ApplicationController
  def index
    @spots = Spot.all

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { spot: spot }),
        spotId: spot.id
      }
    end
    if params[:query].present?
      sql_query = " \
        spots.name @@ :query \
        OR fish.name @@ :query \
        OR fish.family @@ :query \
      "
      @spots = Spot.joins(reviews: { spottings: :fish }).where(sql_query, query: "%#{params[:query]}%")
    else
      @spots = Spot.all
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @spots = []
    @spots << @spot
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { spot: spot })
      }
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id

    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:latitude, :longitude, :name, :description, photos: [])
  end
end
