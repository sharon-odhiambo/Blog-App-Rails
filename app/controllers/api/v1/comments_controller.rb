class Api::V1::CommentsController < ApplicationController
    def new
        @id = current_user.id
        @comment = Comment.new
        render json: @comment
      end
    
      def create
        post = Post.find(params[:id])
        comment = Comment.new(user: current_user, post:, text: comments_params[:text])
        respond_to do |format|
            if comment.save
              format.json { render :show, status: :created, location: comment }
            else
              format.json { render json: comment.errors, status: :unprocessable_entity }
            end
          end
    end