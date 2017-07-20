Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'home#index'
  
  resources :conversations
  resources :messages
  resources :text_messages
  resources :competitions
  post '/competitions/:id', to: 'competitions#pick_winner', as: 'pick_winner'

end
