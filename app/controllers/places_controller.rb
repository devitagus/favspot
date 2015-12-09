class PlacesController < ApplicationController
  before_action :set_place, only: [:show]

  def index
  end

  def show
  end

  def loadplace
    @query = params[:place]
    @client = GooglePlaces::Client.new('AIzaSyDpnqHIiNQfb_dGZgzfgn2z1uxciJkLHYg')
    @spot = @client.spots_by_query(@query).first
    @place_id = @spot.place_id
    @spot = @client.spot(@place_id)

    # @url = @spot.photos[0].fetch_url(800)
    # @id = @spot.formatted_address
  end

  def new
    @place = Place.new
    if params[:place]
      @query = params[:place]
      @client = GooglePlaces::Client.new('AIzaSyDpnqHIiNQfb_dGZgzfgn2z1uxciJkLHYg')
      @spot = @client.spots_by_query(@query).first
      @place_id = @spot.place_id
      @spot = @client.spot(@place_id)
    end
  end

  #POST
  def create
    @place = current_user.places.build(place_params)
    if @place.save
      current_user.savedplaces.build(place: @place)
      flash[:notice] = "Your place was saved."
      redirect_to place_path(@place.id)
    else
      flash[:notice] = "Oops something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
  end

private

def place_params
    # (:todo) is the class, (:title) is the attribute
    params.require(:place).permit(:name, :address, :city, :category, :googleid)
  end

  def set_place
    @place = Place.find(params[:id])
  end


end
