require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(
      name: 'John Doe',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )

    @post = Post.create(
      title: 'Hello World!',
      text: 'This is my first post.',
      comments_counter: 0,
      likes_counter: 0,
      user_id: @user.id
    )

    @like = Like.create(
      user_id: @user.id,
      post_id: @post.id
    )
  end
  it '@like should be valid' do
    expect(@like).to be_valid
  end
  it '@like should have an user' do
    @like.user = nil
    expect(@like).to_not be_valid
  end
  it '@like should have a post' do
    @like.post = nil
    expect(@like).to_not be_valid
  end
end
