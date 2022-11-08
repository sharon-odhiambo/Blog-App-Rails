require 'rails_helper'

RSpec.describe 'Users index', type: :system do
  describe 'users#index page' do
    before(:each) do
      @user1 = User.create(name: 'Sharon',
                           photo: 'https://images.unsplash.com/photo-1667857481501-b447de8ed0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
                           bio: 'Teacher from Kenya')
      @user2 = User.create(name: 'Tom',
                           photo: 'https://images.unsplash.com/photo-1667857481501-b447de8ed0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
                           bio: 'Teacher from Mexico',
                           posts_counter: 0)
      visit users_path
    end
    it 'shows the right user name' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
    it 'shows the right user profile picture' do
      expect(page).to have_css("img[src='#{@user1.photo}']")
      expect(page).to have_css("img[src='#{@user2.photo}']")
    end
    it 'redirects the user to the right user information' do
      expect(page).to have_link(@user1.name, href: user_path(@user1.id))
    end
    it 'redirects the user to the right post' do
      expect(page).to have_link(href: user_path(@user1.id))
    end
  end
  describe 'users#show page' do
    before(:each) do
      @user1 = User.create(name: 'Sharon',
                           photo: 'https://images.unsplash.com/photo-1667857481501-b447de8ed0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
                           bio: 'Teacher from Kenya')
      @user2 = User.create(name: 'Tom',
                           photo: 'https://images.unsplash.com/photo-1667857481501-b447de8ed0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
                           bio: 'Teacher from Mexico',
                           posts_counter: 0)
      @post1 = Post.create(
        title: 'Post 1',
        text: 'Hi, this is my first post',
        comments_counter: 1,
        likes_counter: 1,
        user_id: 1
      )
      visit user_path(@user1)
    end
    it 'shows the right user1 name, bio, profile picture and number of posts' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user1.bio)
      expect(page).to have_css("img[src='#{@user1.photo}']")
      expect(page).to have_content("Number of Posts: #{@user1.posts_counter}")
    end
    it 'shows the right user2 name, bio, profile picture and number of posts' do
      visit user_path(@user2)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user2.bio)
      expect(page).to have_css("img[src='#{@user2.photo}']")
      expect(page).to have_content("Number of Posts: #{@user2.posts_counter}")
    end
    it 'shows the user most recent three posts' do
      expect(@user1.most_recent_posts.count).to be_between(0, 3)
    end
    it 'shows the a button for viewing user posts' do
      expect(page).to have_link('See all Posts', href: user_posts_path(@user1))
    end
  end
end
