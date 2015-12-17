class PlacesController < ApplicationController
  before_action :set_place, only: [:show]
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def show
  end

   def new
    @place = Place.new
    if params[:place]
      @place = Place.find_by(search_query: params[:place])

      if @place.nil?

        @client = GooglePlaces::Client.new('AIzaSyB_BKWWs67Ib71xF65K7eg4Yr_y2hyExhU')

        if params[:place_id].empty?
          @query = params[:place]
          @spot = @client.spots_by_query(@query).first
          @place_id = @spot.place_id
          @spot = @client.spot(@place_id)
        else
          @spot = @client.spot(params[:place_id])
        end
        @place = Place.create(search_query: params[:place], name: @spot.name, address: @spot.formatted_address, city: @spot.city, categories: @spot.types, photos: @spot.photos, rating: @spot.rating, phone: @spot.formatted_phone_number, latitude: @spot.lat, longitude: @spot.lng, google_result: @spot.to_json)
      end
      @saved_place = current_user.savedplaces.build(place: @place)
      if @saved_place.save
        if params[:collection_id]
          collection = Collection.find(params[:collection_id])
          collection.collectedplaces.create(savedplace: @saved_place)
        end
        flash[:notice] = "Your place was saved."
        redirect_to request.referrer
      else
        flash[:notice] = "Oops something went wrong"
        render "new"
      end
    end
  end

  #POST
  def create
    @place = current_user.places.build(place_params)
    if @place.save
      current_user.savedplaces.build(place: @place)
      flash[:notice] = "The place was saved."
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
    params.require(:place).permit(:name, :address, :city, :category, :phone, :latitude, :longitude, :googleid)
  end

  def set_place
    @place = Place.find(params[:id])
  end


end
