class UserpicsController < ApplicationController
  before_action :find_savedplace

  def create
    @user = current_user
    params[:image].each do |image|
      @savedplace.userpics.create(image: image)
    end
  redirect_to user_savedplace_path(@user, @savedplace)
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

