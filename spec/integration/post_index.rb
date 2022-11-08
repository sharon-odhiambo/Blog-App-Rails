require 'rails_helper'

RSpec.describe 'Posts Page', type: :view do
  describe 'posts#index page' do
    before(:each) do
      @user1 = User.create(name: 'Sharon',
                           photo: "https://images.unsplash.com/photo-1667255949472-2f8bba82deb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80\n  ",
                           bio: 'oooooooo',
                           posts_counter: 0)
      @post1 = Post.create(
        title: 'Post 1',
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
      expect(page).to have_content(@post1.title)
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
    it 'creates a pagination if the user posts exceed 5' do
      6.times do |_i|
        Post.create(title: 'Post 1', text: 'This is my first post', user_id: @user1.id)
      end
      expect(page).to have_selector('div', class: 'pagination')
    end
    it 'redirects the user to the right post' do
      expect(page).to have_link(href: user_post_path(@user1, @post1))
    end
  end
end
