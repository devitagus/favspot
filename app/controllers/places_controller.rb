class PlacesController < ApplicationController
  before_action :set_place, only: [:show]

  def index
  end

  def show
  end

  def new
    @place = Place.new
  end

  #POST
  def create
    @place = current_user.places.build(place_params)
    if @place.save
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
