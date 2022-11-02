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
    before(:example) { get '/users/:id' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('users/show')
    end
    it 'shows if the specific user template is rendered correctly' do
      get '/users/:id'
      expect(response.body).to include('<p>Here is a list of posts for a given user</p>')
    end
  end
end
