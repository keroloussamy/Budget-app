Rails.application.routes.draw do
  resources :groups, only: [:new, :create, :index, :show]
  resources :entities, only: [:new, :create, :index, :show]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
