require 'rails_helper'

RSpec.describe 'Users index', type: :system do
  before(:all) do
    @user1 = User.create(name: "Shh",
                        photo: "https://images.unsplash.com/photo-1667255949472-2f8bba82deb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80\n  ",
    bio: "oooooooo",
    posts_counter: 10)
    @user2 = User.create(name: "Mike",
    photo:  "https://images.unsplash.com/photo-1667255949472-2f8bba82deb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80\n  ",
    bio: "Singer",
    posts_counter: 0)
    @post1 = Post.create(
    title: "Hello",
    text: "This is my first post",
    comments_counter: 14,
    likes_counter: 6,
    user_id: 1)
  end
  describe 'users#index page' do
    it 'shows the right user name' do
      visit users_path
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
    it 'shows the right user profile picture' do
        visit users_path
        expect(page).to have_content(@user1.photo)
        expect(page).to have_content(@user2.photo)
      end
    it 'redirects the user to the right post' do
        visit users_path
        click_on @user1.name
        assert_redirected_to user_posts_path(@user1)
    end
    it 'redirects the user to the right post' do
        visit users_path
        click_on @user2.name
        assert_redirected_to user_posts_path(@user2)
    end
  end
  describe 'users#show page' do
  it 'shows the right user1 name, bio, profile picture and number of posts' do
    visit user_path(@user1)
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.bio)
    expect(page).to have_content(@user1.photo)
    expect(page).to have_content(@user1.posts_counter)
  end
  it 'shows the right user2 name, bio, profile picture and number of posts' do
    visit user_path(@user2)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user2.bio)
    expect(page).to have_content(@user2.photo)
    expect(page).to have_content(@user2.posts_counter)
  end
  it 'shows the user most recent three posts' do
    visit user_path(@user1)
    expect(@user1.most_recent_posts.count).to be_between(0, 3)
  end
  it 'shows the a button for viewing user post' do
    visit user_path(@user1)
    expect(page).to have_content('See all Posts')
  end
  it 'redirects the user to the right post' do
    visit users_path
    click_on 'Post: @post1.id'
    assert_redirected_to user_post_path(@post1)
end
it 'redirects the user to the right post' do
    visit users_path
    click_on 'See all Posts'
    assert_redirected_to user_posts_path(@user2)
  end
end
end