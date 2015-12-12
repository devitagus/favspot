class UsertipsController < ApplicationController
  before_action :find_savedplace, only: [:show, :update]
  respond_to :html, :json

  def index
  end

  def create
    p @savedplace
    @usertip = @savedplace.usertips.build(usertip_params)
    @usertip.save
    respond_with @savedplace
  end

  def update
  if params[:id]
    @usertip = @savedplace.usertips.find(params[:id])
    @usertip.update(usertip_params)
  else
    @usertip = @savedplace.usertips.build(usertip_params)
    @usertip.save
  end
    respond_with @savedplace
    # p "#"*20
    # if params[:id].nil?
    #   p @savedplace = Savedplace.find(params[:savedplace_id])
    #   p "#"*20
    #   p new_tip = @savedplace.usertips.build(tip: params[:usertip][:tip])
    #   p "#"*20
    #   new_tip.save
    # else
    #   @savedplace = Savedplace.find(params[:savedplace_id])
    #   new_tip = @savedplace.usertips.find(params[:id])
    #   new_tip.tip = params[:usertip][:tip]
    #   new_tip.save
    # end
    # respond_with @savedplace

  end

  def destroy
  end
end


  private

  def find_savedplace
      @savedplace = Savedplace.find(params[:savedplace_id])
  end

  def usertip_params
      params.require(:usertip).permit(:tip)
  end
