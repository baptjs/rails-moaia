class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    # Search (from home page)

    if params[:query].present?
      sql_query = " \
        spots.name @@ :query \
        OR spots.region @@ :query \
        OR fish.name @@ :query \
      "
      @spots = Spot.joins(reviews: { spottings: :fish }).where(sql_query, query: "%#{params[:query]}%").uniq

    else
      @spots = Spot.all
    end

    # Search filters
    spots_filter = params[:spots_filter]

    if spots_filter.present?
      #Search bar
      if spots_filter[:search].present?
        sql_query = " \
        spots.name @@ :query \
        OR spots.region @@ :query \
        OR fish.name @@ :query \
        "
        @spots = Spot.joins(reviews: { spottings: :fish }).where(sql_query, query: "%#{spots_filter[:search]}%")
      end

      # Tags : type of dive
      # Option 1: when many tags are selected, we want to display the spots that correspond to EITHER of them
      if spots_filter[:dive_type].present? && spots_filter[:dive_type] != [""]
        tags_ids = []
        spots_filter[:dive_type].each do |tag_id|
          next if tag_id == ""
          tags_ids << tag_id.to_i
        end
          @spots = @spots.joins(:dive_type_taggings).where(dive_type_taggings: {dive_type_tag_id: tags_ids}) unless tags_ids.empty?
      end

      # Option 2: when many tags are selected, we want to display the spots that correspond to ALL of them
      # if spots_filter[:tags1].present?
      #   array_of_filtered_spots = []
      #   result = []
      #   spots_filter[:tags1].each do |tag_id|
      #     next if tag_id == ""
      #     filtered_spots = @spots.joins(:spot_tags).where(spot_tags: {tag_id: tag_id.to_i})
      #     array_of_filtered_spots  << filtered_spots
      #   end
      #   unless array_of_filtered_spots.empty?
      #     array_of_filtered_spots[0].each do |spot|
      #       arr = array_of_filtered_spots.map {|filtered_spots| filtered_spots.include? spot }
      #       result << spot unless arr.include?(false)
      #     end
      #     @spots = result
      #   end
      # end

      # Tags : difficulty
      # Option 1: when many tags are selected, we want to display the spots that correspond to EITHER of them

      if spots_filter[:difficulty].present? && spots_filter[:difficulty] != [""]
        tags_ids = []
        spots_filter[:difficulty].each do |tag_id|
          next if tag_id == ""
          tags_ids << tag_id.to_i
        end
          @spots = @spots.joins(:difficulty_taggings).where(difficulty_taggings: {difficulty_tag_id: tags_ids}) unless tags_ids.empty?
      end

      # Option 2: when many tags are selected, we want to display the spots that correspond to ALL of them
      # if spots_filter[:tags2].present?
      #   array_of_filtered_spots = []
      #   result = []
      #   spots_filter[:tags2].each do |tag_id|
      #     next if tag_id == ""
      #     filtered_spots = @spots.joins(:spot_tags).where(spot_tags: {tag_id: tag_id.to_i})
      #     array_of_filtered_spots  << filtered_spots
      #   end
      #   unless array_of_filtered_spots.empty?
      #     array_of_filtered_spots[0].each do |spot|
      #       arr = array_of_filtered_spots.map {|filtered_spots| filtered_spots.include? spot }
      #       result << spot unless arr.include?(false)
      #     end
      #     @spots = result
      #   end
      # end

      # Tags : attractions
      # Option 1: when many tags are selected, we want to display the spots that correspond to EITHER of them
      if spots_filter[:attractions].present? && spots_filter[:attractions] != [""]
        # raise
        tags_ids = []
        spots_filter[:attractions].each do |tag_id|
          next if tag_id == ""
          tags_ids << tag_id.to_i
        end
          @spots = @spots.joins(:attractions_taggings).where(attractions_taggings: {attractions_tag_id: tags_ids}) unless tags_ids.empty?
      end

      # Option 2: when many tags are selected, we want to display the spots that correspond to ALL of them
      # if spots_filter[:tags3].present?
      #   array_of_filtered_spots = []
      #   result = []
      #   spots_filter[:tags3].each do |tag_id|
      #     next if tag_id == ""
      #     filtered_spots = @spots.joins(:spot_tags).where(spot_tags: {tag_id: tag_id.to_i})
      #     array_of_filtered_spots  << filtered_spots
      #   end
      #   unless array_of_filtered_spots.empty?
      #     array_of_filtered_spots[0].each do |spot|
      #       arr = array_of_filtered_spots.map {|filtered_spots| filtered_spots.include? spot }
      #       result << spot unless arr.include?(false)
      #     end
      #     @spots = result
      #   end
      # end

      # Species
      if spots_filter[:fish].present? && spots_filter[:fish] != [""]

        @spots = @spots.joins(reviews: { spottings: :fish }).where(reviews: {spottings: {fish_id: spots_filter[:fish]}})

      end

      @spots = @spots.uniq
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

    redirect_to spots_path if @spots.empty?
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
    params.require(:spot).permit(:latitude, :longitude, :name, :region, :description, photos: [], init_dive_type_tags: [], init_difficulty_tags: [], init_attractions_tags: [])
  end

end
