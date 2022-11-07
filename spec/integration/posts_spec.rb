require 'rails_helper'

RSpec.describe 'Posts Page', type: :system do
  before(:all) do
    @user1 = User.create(name: "Shh",
                        photo: "https://images.unsplash.com/photo-1667255949472-2f8bba82deb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80\n  ",
    bio: "oooooooo",
    posts_counter: 10)
    @post1 = Post.create(
    title: "Hello",
    text: "This is my first post",
    comments_counter: 14,
    likes_counter: 6,
    user_id: @user1.id)
    @comment = Comment.create(post: @post1, user: @user1, text: "Hi Tom!")
  end
  describe 'posts#index page' do
    it 'displays the right user name' do
      visit user_posts_path
      expect(page).to have_content(@user1.photo)
    end
    it 'shows the right user profile picture' do
        visit user_posts_path
        expect(page).to have_content(@user1.name)
      end
    it 'shows the right user profile picture' do
        visit user_posts_path
        expect(page).to have_content(@user1.posts_counter)
      end
    it 'shows the right user post title' do
        visit user_posts_path
        expect(page).to have_content(@post1.title)
      end
    it 'shows the right user post body' do
        visit user_posts_path
        expect(page).to have_content(@post1.text)
      end
    it 'shows the user post 1 first comment' do
        visit user_posts_path
        expect(page).to have_content(@comment.text)
      end
    it 'shows the user post 1 comments' do
        visit user_posts_path
        expect(page).to have_content(@post1.comments_counter)
      end
    it 'shows the user post 1 likes' do
        visit user_posts_path
        expect(page).to have_content(@post1.likes_counter)
      end
    it 'redirects the user to the right post' do
        visit user_posts_path
        click_on 'Post: @post1.id'
        assert_redirected_to user_post_path(@post1)
    end
  end
  describe 'pposts#show page' do
  it 'shows the right title of the post' do
    visit user_post_path(@post1)
    expect(page).to have_content(@post1.title)
  end
  it 'shows the right username of who added the post' do
    visit user_post_path(@post1)
    expect(page).to have_content(@post1.user.name)
  end
  it 'shows the right number of comments in a post' do
    visit user_post_path(@post1)
    expect(page).to have_content(@post1.comments_counter)
  end
  it 'shows the right number of likes in a post' do
    visit user_post_path(@post1)
    expect(page).to have_content(@post1.likes_counter)
  end
  it 'shows the right body of the post' do
    visit user_post_path(@post1)
    expect(page).to have_content(@post1.text)
  end
  it 'shows the right username of a commentor' do
    visit user_post_path(@post1)
    expect(page).to have_content(@comment.user.name)
  end
  it 'shows the right comment by a commentor' do
    visit user_post_path(@post1)
    expect(page).to have_content(@comment.text)
  end
end
end