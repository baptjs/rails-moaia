class SpotsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
  end

  private

  def spot_params
    params.require(:spot).permit(:latitude, :longitude, :name, :description)
  end
end
