class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, class_name: 'User'
  after_save :update_posts_counter

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end
end
