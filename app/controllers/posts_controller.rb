class PostsController < ApplicationController
  # before_action :set_user, only: %i[index show create destroy]
  load_and_authorize_resource

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = @user.posts.paginate(page: 1, per_page: 5)
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
    flash[:notice] = if post.save
                       'Post created successfully'
                     else
                       'Error'
                     end
    redirect_to user_posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    @user.posts_counter -= 1
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
