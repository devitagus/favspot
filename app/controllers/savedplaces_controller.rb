class SavedplacesController < ApplicationController
before_action :find_savedplace, only: [:show]


  def index
  end

  def edit
  end

  def show
  end

  def destroy
  end



private

def find_savedplace
    @savedplace = Savedplace.find(params[:id])
  end
end



