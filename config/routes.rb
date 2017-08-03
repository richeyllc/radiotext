Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'home#index'
  
  resources :conversations, only: [:index, :create]
  resources :messages
  resources :text_messages
  resources :competitions
  resources :listeners, only: [:index, :edit, :update]
  post '/competitions/:id', to: 'competitions#pick_winner', as: 'pick_winner'
  
  get '/mass_messages' => 'messages#get_mass_messages', as: 'get_mass_messages'
  post '/mass_messages' => 'messages#mass_messages', as: 'mass_messages'
end