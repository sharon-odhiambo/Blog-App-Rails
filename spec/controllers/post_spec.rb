require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    @user1 = User.create(name: 'Sharon',
                         photo: 'https://images.unsplash.com/photo-1667857481501-b447de8ed0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
                         bio: 'Teacher from Kenya',
                         posts_counter: 4)
    @post1 = Post.create(
      title: 'Post 1',
      text: 'Hi, this is my first post',
      comments_counter: 2,
      likes_counter: 1,
      user_id: 1
    )
  end
  describe 'GET #index' do
    before(:example) { get '/users/1/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
  describe 'GET #show' do
    before(:example) { get '/users/1/posts/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('posts/show')
    end
    it 'shows if the specific user template is rendered correctly' do
      get '/users/1/posts/1'
      expect(response.body).to include("<h1> Sharon's Post 1 </h1>")
    end
  end
end
