Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :contracts do
      post :accept
      post :reject
      post :modify
      post :accept_modification
      post :reject_modification
      post :edited
    end
  end

  get "profile", to: "profiles#edit", as: :edit_profile
  get "profile", to: "profiles#show", as: :show_profile
  patch "profile", to: "profiles#update"

  root to: "home#index"
end
