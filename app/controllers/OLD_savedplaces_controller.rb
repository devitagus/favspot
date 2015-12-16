class SavedplacesController < ApplicationController

before_action :set_savedplace, only: [:show, :update, :edit]
before_action :authenticate_user!, only: [:show, :index]
respond_to :html, :json


  def index
  end

  def edit
    respond_to do |format|
    format.js
   end
  end

  def show
    @userpic = Userpic.new
    @usertip = Usertip.new
    # @usertips = @savedplace.usertips
  end

  def destroy
  end

  def update
    @savedplace.update(savedplace_params)
    respond_with @savedplace

    # redirect_to savedplace_path(@savedplace)
    # @savedplace = @cocktail.doses.build(dose_params)
  end



  private

  def set_savedplace
      @savedplace = Savedplace.find(params[:id])
  end

  def savedplace_params
      params.require(:savedplace).permit(:headline, :tag, :tip, :notes)
  end

end
