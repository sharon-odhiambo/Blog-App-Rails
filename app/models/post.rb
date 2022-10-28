class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, class_name: 'User'
  after_save :update_posts_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end
end
