Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  resources :replies
  resources :articles, only: [:show] do
    resources :comments, only: [:show, :index]
  end
  resources :comments
  resources :users
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
