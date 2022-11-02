require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'assigns all posts to @posts' do
      get '/users/:user_id/posts'
      expect(assigns(:posts)).to eq(Post.all)
    end
  end
  describe 'GET #show' do
    before(:example) { get '/users/:user_id/posts/:id' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('posts/show')
    end
    it 'shows if the specific user template is rendered correctly' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('<h2> Here is a name of a specic user who made a post </h2>')
    end
  end
end
