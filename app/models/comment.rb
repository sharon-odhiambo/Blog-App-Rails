class Comment < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :posts

  def update_comments_counter
    Post.update(comments_counter: Post.first.comments.count)
  end
end
