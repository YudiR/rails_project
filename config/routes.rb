Rails.application.routes.draw do
 
  resources :users, only: [:new, :create, :edit, :update, :items]
  resources :items
  resources :sessions, only: [:new, :create, :destroy]

  root 'items#index'
end
