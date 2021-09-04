Rails.application.routes.draw do
  resources :calendars
  devise_for :users
  root to: 'checks#index' 
  resources :checks
  resources :completes, only: [:index, :create, :new, :edit, :update, :destroy]
  resources :donations, only: [:new, :create]
end
