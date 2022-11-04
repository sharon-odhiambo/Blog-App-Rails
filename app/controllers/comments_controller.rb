class CommentsController < ApplicationController
  def new
    @id = current_user.id
    @comment = Comment.new
  end

  def create
    comment = Comment.new(post_params)
    if comment.save
      flash[:notice] = 'Post created successfully'
    else
      flash[:error] = 'Error'
    end
    redirect_to user_post_comments_path
  end

  private
  def post_params
    params.permit(:text)
  end
end