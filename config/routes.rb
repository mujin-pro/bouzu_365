Rails.application.routes.draw do
  devise_for :users
  root to: 'checks#index' 
  resources :checks, only: [:index, :create, :new]
  resources :completes, only: [:index, :create, :new]
end
