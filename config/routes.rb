Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  post 'logout' => 'sessions#destroy'

  resources :articles, only: [:show] do
    resources :comments, only: [:show, :index]
  end
  
  resources :replies
  resources :comments
  resources :users
  resources :articles

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
