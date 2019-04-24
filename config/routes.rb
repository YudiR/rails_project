Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'user/new'
  get 'user/create'
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'
  get 'items/index'
  get 'items/new'
  get 'items/create'
  get 'items/edit'
  get 'items/update'
  get 'items/show'
  get 'items/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
