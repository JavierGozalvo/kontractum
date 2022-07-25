Rails.application.routes.draw do
  resources :users
  resources :contracts
  resources :contract

  root "layouts#application"
end
