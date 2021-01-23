Rails.application.routes.draw do
  resources :articles, only: [:show] do
    resources :comments, only: [:show, :index]
  end
  resources :comments
  resources :users
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
