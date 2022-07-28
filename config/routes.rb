Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  get "password", to: "passwords#edit", as: :edit_password
  post "password", to: "passwords#update"
  
  resources :users
  resources :contracts
  
end
