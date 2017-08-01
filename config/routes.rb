Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'home#index'
  
  resources :conversations, only: [:index, :create]
  resources :messages
  resources :text_messages
  resources :competitions
  resources :listeners, only: [:edit, :update]
  post '/competitions/:id', to: 'competitions#pick_winner', as: 'pick_winner'
end