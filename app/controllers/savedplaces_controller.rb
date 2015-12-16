class SavedplacesController < ApplicationController
  # method find_restaurant will be called to new and create before running them
  before_action :find_user, only: [:new, :create, :index, :show, :update]
  respond_to :html, :json

  def index
    @savedplaces = @user.savedplaces
    # DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@savedplaces) do |savedplace, marker|
      marker.lat savedplace.place.latitude
      marker.lng savedplace.place.longitude
    end
  end

  def new
    @savedplace = Savedplace.new
  end

  def show
    @savedplace = @user.savedplaces.find(params[:id])
    @userpic = Userpic.new

    # DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@savedplace) do |savedplace, marker|
      marker.lat savedplace.place.latitude
      marker.lng savedplace.place.longitude
    end
  end

  def edit
    respond_to do |format|
    format.js
   end
  end

  def update
    @savedplace = @user.savedplaces.find(params[:id])
    @savedplace.update(savedplace_params)
    respond_with @savedplace, :location => user_savedplace_path(@user,@savedplace)
    # redirect_to savedplace_path(@savedplace)
    # @savedplace = @cocktail.doses.build(dose_params)
  end



  private

  def savedplace_params
      params.require(:savedplace).permit(:headline, :tag, :tip, :notes)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end



