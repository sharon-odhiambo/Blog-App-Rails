class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :users, class_name: 'User'

  def update_posts_counter
    User.update(posts_counter: User.first.post.count)
  end

  def most_recent_comments
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end
end
