class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :post_form]
  before_action :correct_user, only: :destroy
  def post_form
    @micropost = current_user.microposts.new
  end
  def like
    @post = Micropost.find(params[:micropost_id])
    post_like = @post.likes.find_or_initialize_by(user: current_user)
    post_like.liked = true
    post_like.disliked = false
    post_like.save  
    respond_to do |format|
    format.html { redirect_to root_path }
    format.js
    end

  end
  def dislike
    @post = Micropost.find(params[:micropost_id])
    post_like = @post.likes.find_or_initialize_by(user: current_user)
    post_like.disliked = true
    post_like.liked = false
    post_like.save
    @post_liked = @post.likes.find_by(user: current_user)
    respond_to do |format|
    format.html { redirect_to root_path }
    format.js
    end

    # post = Micropost.find(params[:micropost_id])
    # post.likes.create(user: current_user, disliked: true)
    # redirect_to root_path
  end
  def create

    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "New Post Created!"
      redirect_to static_pages_home_path
      # render 'users#show'
    else
      render 'microposts/post_form'
    end
  end
  def destroy
    # @micropost.destroy
    @micropost.update(archived: true)
    flash[:success] = "Post archieved"
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :title, :status, :visibility, :image)
  end
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
