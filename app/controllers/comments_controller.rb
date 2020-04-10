class CommentsController < ApplicationController
  def create
    @micropost = Micropost.find_by(id: params[:micropost_id])
    @comment = @micropost.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
