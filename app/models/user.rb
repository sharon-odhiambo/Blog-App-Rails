class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def most_recent_posts
    Post.limit(3).order(created_at: :desc).where(user: self)
  end
end
