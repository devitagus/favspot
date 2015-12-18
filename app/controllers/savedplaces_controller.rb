class SavedplacesController < ApplicationController
  # method find_restaurant will be called to new and create before running them
  before_action :find_user, only: [:new, :create, :index, :show, :update]
  respond_to :html, :json

  def index
    if has_filter?
      @savedplaces = @user.savedplaces.joins(:place).where("places.city = ?", params[:city])
    else
      @savedplaces = @user.savedplaces
    end
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
    @savedplace.tag =  @savedplace.usertags.map(&:tag).join(", ")
    @userpic = Userpic.new
    @userpics = @savedplace.userpics
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

    check_deleted_tags
    params[:savedplace][:tag].split(",").each do |tag|
      Usertag.create(tag: tag.strip, savedplace: @savedplace )
    end
    respond_with @savedplace, :location => user_savedplace_path(@user,@savedplace)
    # redirect_to savedplace_path(@savedplace)
    # @savedplace = @cocktail.doses.build(dose_params)
  end

  private

  def check_deleted_tags
    to_be_deleted_tags = @savedplace.usertags.map(&:tag) - params[:savedplace][:tag].split(",")
    to_be_deleted_tags.each do |delete_tag|
      @savedplace.usertags.find_by(tag: delete_tag).destroy
    end

  end

  def savedplace_params
      params.require(:savedplace).permit(:headline, :tag, :tip, :notes)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def has_filter?
    params.include?(:city)
  end
end



