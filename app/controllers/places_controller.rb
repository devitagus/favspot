class PlacesController < ApplicationController
  before_action :set_place, only: [:show]
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def show
  end

  def add
    if params[:place]
      @place = Place.find_by(search_query: params[:place])
      if @place.nil?
        @query = params[:place]
        @client = GooglePlaces::Client.new(ENV['GOOGLE_ID'])
        @spot = @client.spots_by_query(@query).first
        @place_id = @spot.place_id
        @spot = @client.spot(@place_id)
        @place = Place.create(search_query: params[:place], name: @spot.name, address: @spot.formatted_address, city: @spot.city, categories: @spot.types, photos: @spot.photos, rating: @spot.rating, google_result: @spot.to_json)
      end
    end
    if @place.save
      current_user.savedplaces.build(place: @place)
      flash[:notice] = "Your place was saved."
      redirect_to places_path(@place.id)
    else
      flash[:notice] = "Oops something went wrong"
      render "new"
    end
  end

  def new
    @place = Place.new
    if params[:place]
      @place = Place.find_by(search_query: params[:place])

      if @place.nil?

        @client = GooglePlaces::Client.new(ENV['GOOGLE_ID'])

        # [FIX:] SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
        # error

        if params[:place_id].nil?

          @query = params[:place]
          @spot = @client.spots_by_query(@query).first
          @place_id = @spot.place_id
          @spot = @client.spot(@place_id)
        else
          @spot = @client.spot(params[:place_id])
        end
        @place = Place.create(search_query: params[:place], name: @spot.name, address: @spot.formatted_address, city: @spot.city, categories: @spot.types, photos: @spot.photos, rating: @spot.rating, google_result: @spot.to_json)
      end
      @saved_place = current_user.savedplaces.build(place: @place)
      if @saved_place.save
        flash[:notice] = "Your place was saved."
        redirect_to savedplaces_path
      else
        flash[:notice] = "Oops something went wrong"
        render "new"
      end
    end
  end

  #POST
  def create
    raise
    @place.user = current_user
    @place = current_user.places.build(place_params)
    if @place.save
      current_user.savedplaces.build(place: @place)
      flash[:notice] = "Your place was saved."
      redirect_to place_path(@place)
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
