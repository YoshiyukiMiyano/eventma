Rails.application.routes.draw do
  get 'sessions/new'

  root 'events#index'
  
  resources :participants
  resources :events
  resources :users
#  resources :users, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
