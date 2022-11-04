class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @id = current_user.id
    @post = Post.new
  end

  def create
    post = Post.new(title: post_params[:title], text: post_params[:text], user: current_user)
    if post.save
          notice = 'Post created successfully'
      else
          notice = 'Error'
        end
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
