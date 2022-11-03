Rails.application.routes.draw do
  root 'users#index' 
  # get "/users/:id" => "users#show", as: 'user'
  # get "/users/:id/posts" => "posts#index", as: 'posts'
  # get "/users/:id/posts/:id" => "posts#show", as: 'post'
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
