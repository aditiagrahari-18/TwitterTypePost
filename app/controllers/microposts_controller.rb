class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :post_form]
  before_action :correct_user, only: :destroy
  def post_form
    @micropost = current_user.microposts.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to static_pages_home_path
      # render 'users#show'
    else
      @microposts = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    # @micropost.destroy
    @micropost.update(archived: true)
    flash[:success] = "Micropost archieved"
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :title)
  end
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
