class LikesController < ApplicationController
    def create
      @liked = Post.find(params[:id])
      like = Like.new(post: @liked, user: current_user)
      if like.save
        redirect_to user_post_likes_path(@liked, user)
      end
    end
  end