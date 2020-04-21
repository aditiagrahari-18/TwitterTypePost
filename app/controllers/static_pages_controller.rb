class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      # @micropost = current_user.microposts.build
      @microposts = current_user.microposts.where(archived: false).paginate(page: params[:page])
      @posts = current_user.microposts.where(archived: true).paginate(page: params[:page])
    end
  end
  def allpost
      @microposts = Micropost.all.where(archived: false).paginate(page: params[:page])
  end
  def index
    @users = User.paginate(page: params[:page])
  end
  def help
  end
end
