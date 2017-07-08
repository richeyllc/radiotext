Rails.application.routes.draw do
  root to: 'competitions#index'
  resources :competitions
end
