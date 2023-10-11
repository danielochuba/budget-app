Rails.application.routes.draw do
  resources :categories
  resources :deals
  devise_for :users

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
