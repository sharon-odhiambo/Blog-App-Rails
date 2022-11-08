require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'assigns all users to @users' do
      get users_path
      expect(assigns(:users)).to eq(User.all)
    end
  end
  describe 'GET #show' do
    before(:all) do
      @user1 = User.create(name: 'Sharon',
                           photo: 'https://images.unsplash.com/photo-1667857481501-b447de8ed0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
                           bio: 'Teacher from Kenya',
                           posts_counter: 4)
    end
    before(:example) { get '/users/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('users/show')
    end
    it 'shows if the specific user template is rendered correctly' do
      get '/users/1'
      expect(response.body).to include("<h1>Sharon's Most Recent Posts</h1>")
    end
  end
end
