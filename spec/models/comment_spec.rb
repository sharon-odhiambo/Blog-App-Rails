require 'rails_helper'

RSpec.describe Comment, type: :model do
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
    @comment = Comment.create(
      text: 'This is my first comment.',
      user_id: @user.id,
      post_id: @post.id
    )
  end
  it '@comment should be valid' do
    expect(@comment).to be_valid
  end
  it '@comment should have a user' do
    @comment.user = nil
    expect(@comment).to_not be_valid
  end
  it '@comment should have a post' do
    @comment.post = nil
    expect(@comment).to_not be_valid
  end
  it '@comment should have a text' do
    @comment.text = nil
    expect(@comment).to_not be_valid
  end
end
