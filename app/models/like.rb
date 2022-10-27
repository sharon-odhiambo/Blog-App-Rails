class Like < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  def update_likes_counter
    Post.update(likes_counter: Post.first.likes.count)
  end
end
