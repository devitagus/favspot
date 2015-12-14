class CollectionsController < ApplicationController
  before_action :find_user, only: [:new, :create, :index, :show]

  def index
    @collections = @user.collections
  end

  def new
    @collection = Collection.new
  end

  def show
    @collection = @user.collections.find(params[:id])
  end

  def create
    @collection = Collection.new(collection_params)
    # @collection.set_user!(current_user)
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      flash[:notice] = "Your collection was created."
      redirect_to user_collections_path(current_user)
    else
      flash[:notice] = "Oops something went wrong"
      render :new
    end
  end


private

def collection_params
    params.require(:collection).permit(:name)
  end

  def find_user
    @user = User.find(params[:user_id])
  end


end
