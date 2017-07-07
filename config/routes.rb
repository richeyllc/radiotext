Rails.application.routes.draw do
  root to: 'competitions#index'
  get '/competitions' => 'competitions#index'
end
