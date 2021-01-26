  
Rails.application.routes.draw do
  resources :subscriptions
  resources :users
  resources :articles
  resources :comments
  resources :replies
  
  resources :articles, only: [:show] do
    resources :comments, only: [:show, :index]
  end
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  post 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

