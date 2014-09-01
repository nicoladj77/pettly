Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :photos, only: [:new, :create]
  get '/photos/new_multiple', to: 'photos#new_multiple', as: :new_photo_multiple
end
