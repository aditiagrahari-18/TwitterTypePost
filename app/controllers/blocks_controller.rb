class BlocksController < ApplicationController
  def create
    current_user.blocks.find_or_create_by(blocked: params[:user_id])
    redirect_to followers_user_path(current_user)
  end
  def destroy
    blocked = current_user.blocks.find_by(blocked: params[:user_id], id: params[:id])
    blocked.destroy
    redirect_to followers_user_path(current_user)
  end
end
