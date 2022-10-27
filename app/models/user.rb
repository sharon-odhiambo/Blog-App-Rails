class User < ApplicationRecord
  has_many :post
  has_many :likes
  has_many :comments

  def most_recent_posts
    Post.limit(3).order(created_at: :desc).where(user: self)
  end
end
