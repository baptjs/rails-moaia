class SpotsController < ApplicationController
  def index
    # Search (from home page)
    if params[:query].present?
      sql_query = " \
        spots.name @@ :query \
        OR spots.country @@ :query \
        OR fish.name @@ :query \
      "
      @spots = Spot.joins(reviews: { spottings: :fish }).where(sql_query, query: "%#{params[:query]}%").uniq

    else
      @spots = Spot.all
    end

    # Search filters
    # @spots = @spots.where.not(latitude: nil, longitude: nil)

    spots_filter = params[:flats_filter]

    if spots_filter.present?
      if spots_filter[:search].present?
        sql_query = " \
        spots.name @@ :query \
        OR spots.country @@ :query \
        OR fish.name @@ :query \
      "
      @spots = Spot.joins(reviews: { spottings: :fish }).where(sql_query, query: "%#{params[:query]}%").uniq
      end
    end


    # Mapbox markers
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { spot: spot }),
        spotId: spot.id
      }
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
      # redirect_to spot_path(@spot)
      redirect_to new_spot_review_path(@spot)
    else
      render :new
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:latitude, :longitude, :name, :description, photos: [])
  end
end
