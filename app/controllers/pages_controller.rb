class PagesController < ApplicationController
  # before_action :authenticate_user!, only: [:home]

  def home
    @resource = User.new
  end
end
