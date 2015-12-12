class UserpicsController < ApplicationController
  before_action :find_savedplace

  def create
    params[:image].each do |image|
      @savedplace.userpics.create(image: image)
    end
  redirect_to savedplace_path(@savedplace)
  end

  def update
  end

  def destroy
  end
end


private

  # def userpic_params
  #   params.require(:image).permit(:image)
  # end
  def find_savedplace
    @savedplace = Savedplace.find(params[:savedplace_id])
  end

