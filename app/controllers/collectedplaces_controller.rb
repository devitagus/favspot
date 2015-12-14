class CollectedplacesController < ApplicationController
  def new
    @collectedplace = Collectedplace.new
  end

  def create
    @savedplace = Savedplace.find(params[:savedplace_id])
    @collectedplace = Collectedplace.new(savedplace_id: params[:savedplace_id], collection_id: params[:collection][:id][1])

    if @collectedplace.save

      flash[:notice] = "Place added to collection."
      redirect_to user_savedplace_path(current_user,@savedplace)
    else
      flash[:notice] = "Oops something went wrong"
      render "show"
    end
  end


end


