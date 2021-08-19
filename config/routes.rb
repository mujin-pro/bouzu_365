Rails.application.routes.draw do
  devise_for :users
  root to: 'checks#index' 
  resources :checks, only: [:index, :create]
  resources :completes, only: [:index, :create]
end
