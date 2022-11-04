Rails.application.routes.draw do
  root 'users#index' 
  # get "/users/:id" => "users#show", as: 'user'
  # get "/users/:id/posts" => "posts#index", as: 'posts'
  # get "/users/:id/posts/:id" => "posts#show", as: 'post'
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/users/:id/posts/:id/new" => "comments#new", as: 'new_user_post_comment'
  post "/users/:id/posts/:id" => "comments#create", as: 'user_post_comments'
  post "/users/:id/posts" => "likes#create", as: 'user_post_likes'
  # Defines the root path route ("/")
  # root "articles#index"
end
