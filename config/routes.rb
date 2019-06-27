Rails.application.routes.draw do
 
  
  
  resources :users, only: [:new, :create, :edit, :update] do
    collection do
      get 'items'
      get 'watching'
   
      end
    end

  resources :items do
    collection do
      get 'about'
      
    end
  end

  get 'items/watch/:id', :to => 'items#watch'
  get 'users/:id', :to => 'users#sign_out'   
  resources :sessions, only: [:new, :create, :destroy]

  root 'items#index'
end
