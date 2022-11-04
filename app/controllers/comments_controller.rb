class CommentsController < ApplicationController
  def new
    @id = current_user.id
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:id])
    comment = Comment.new(user: current_user, post:, text: post_params[:text])
    if comment.save
      flash[:notice] = 'Comment created successfully'
    else
      flash[:error] = 'Error'
    end
    redirect_to user_post_comments_path
  end

  private

  def post_params
    params.require(:comment).permit(:text)
  end
end