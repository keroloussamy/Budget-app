Rails.application.routes.draw do
  resources :groups, only: [:create, :index, :show]
  resources :entities, only: [:create, :index, :show]
  devise_for :users, only: [:create, :index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
