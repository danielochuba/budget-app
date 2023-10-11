Rails.application.routes.draw do
  resources :categories do
    resources :deals
  end
  devise_for :users

  root "home#index"
end
