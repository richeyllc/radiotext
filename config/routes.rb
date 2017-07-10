Rails.application.routes.draw do
  root to: 'competitions#index'
  resources :competitions
  post '/competitions/:id', to: 'competitions#pick_winner', as: 'pick_winner'
end
