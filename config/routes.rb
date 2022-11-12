Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  namespace :api do
      resources :users, only: [:show] do
        resources :posts, only: [:index, :show] do
        resources :comments, only: [:index, :new, :create, :show]
      end
    end
  end
  root 'users#index' 
  # get "/users/:id" => "users#show", as: 'user'
  # get "/users/:id/posts" => "posts#index", as: 'posts'
  # get "/users/:id/posts/:id" => "posts#show", as: 'post'
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create, :destroy]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/users/:id/posts/:id/new" => "comments#new", as: 'new_user_post_comment'
  post "/users/:id/posts/:id" => "comments#create", as: 'user_post_comments'
  delete "/users/:id/posts/:id/comments" => "comments#destroy", as: 'user_post_comment_destroy'
  post "/users/:id/posts/:id/likes" => "likes#create", as: 'user_post_likes'
  # Defines the root path route ("/")
  # root "articles#index"
end
