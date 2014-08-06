Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :photos, only: [:new, :create]
  get '/photos/new_multiple', to: 'photos#new_multiple', as: :new_photo_multiple
end
