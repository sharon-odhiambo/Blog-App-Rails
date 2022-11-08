require 'rails_helper'

RSpec.describe 'Posts Page', type: :view do
  describe 'posts#index page' do
    before(:each) do
      @user1 = User.create(name: 'Sharon',
                           photo: "https://images.unsplash.com/photo-1667255949472-2f8bba82deb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80\n  ",
                           bio: 'oooooooo',
                           posts_counter: 0)
      @post1 = Post.create(
        title: 'Hello',
        text: 'This is my first post',
        comments_counter: 14,
        likes_counter: 6,
        user_id: @user1.id
      )
      visit user_posts_path(@user1)
    end
    it 'shows the right user profile picture' do
      expect(page).to have_css("img[src='#{@user1.photo}']")
    end
    it 'shows the right user name' do
      expect(page).to have_content(@user1.name)
    end
    it 'shows the right user posts counter' do
      expect(body).to have_content('Number of Posts: 1')
    end
    it 'shows the right user post title' do
      expect(page).to have_content("Post :#{@post1.id}")
    end
    it 'shows the right user post body' do
      expect(page).to have_content(@post1.text)
    end
    it 'shows the user post 1 comments' do
      expect(page).to have_content(@post1.comments_counter)
    end
    it 'shows the user post 1 likes' do
      expect(page).to have_content(@post1.likes_counter)
    end
    it 'redirects the user to the right post' do
      expect(page).to have_link(href: user_post_path(@user1, @post1))
    end
  end
  describe 'pposts#show page' do
    before(:each) do
      @user1 = User.create(name: 'Sharon',
                           photo: "https://images.unsplash.com/photo-1667255949472-2f8bba82deb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80\n  ",
                           bio: 'oooooooo',
                           posts_counter: 10)
      @post1 = Post.create(
        title: 'Hello',
        text: 'This is my first post',
        comments_counter: 14,
        likes_counter: 6,
        user_id: @user1.id
      )
      @comment = Comment.create(post: @post1, user: @user1, text: 'Hi Tom!')
      visit user_post_path(@user1, @post1)
    end
    it 'shows the right title of the post' do
      expect(page).to have_content(@post1.title)
    end
    it 'shows the right username of who added the post' do
      expect(page).to have_content(@post1.user.name)
    end
    it 'shows the right number of comments in a post' do
      expect(page).to have_content(@post1.comments_counter)
    end
    it 'shows the right number of likes in a post' do
      expect(page).to have_content(@post1.likes_counter)
    end
    it 'shows the right body of the post' do
      expect(page).to have_content(@post1.text)
    end
    it 'shows the right username of a commentor' do
      expect(page).to have_content(@comment.user.name)
    end
    it 'shows the right comment by a commentor' do
      expect(page).to have_content(@comment.text)
    end
  end
end
