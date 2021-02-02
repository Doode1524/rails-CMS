  
Rails.application.routes.draw do
  resources :subscriptions
  resources :users
  resources :comments
  resources :replies
  
  resources :articles, only: [:index] do
    resources :comments, only: [:show, :index]
  end
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  post 'logout' => 'sessions#destroy'

  get 'articles/:id/comments/:id/replies/new' => 'replies#new'
  post 'articles/:id/comments/:id/replies/new' => 'replies#create'

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

