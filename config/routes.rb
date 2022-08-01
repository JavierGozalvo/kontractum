Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :contracts

  get "profile", to: "profiles#edit", as: :edit_profile
  get "profile", to: "profiles#show", as: :show_profile
  patch "profile", to: "profiles#update"

  root to: "home#index"
end
