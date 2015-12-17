class PagesController < ApplicationController
  # before_action :authenticate_user!, only: [:home]

  def home
    @resource = User.new
    @collection = Collection.new
    if user_signed_in?
      @user = current_user
      @savedplaces = @user.savedplaces
      @collections = @user.collections
    end
  end
end
