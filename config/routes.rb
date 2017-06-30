Rails.application.routes.draw do
  get 'settings/dashboard'

  # Create the API routes
  namespace :api do
    namespace :v1 do
      resources :messages do
        post 'update_message', to: 'messages#update_message'
      end
    end
  end

  # Twilio communication routes
  post 'twilio', to: 'twilio_router#incoming_message'
  get 'twilio', to: 'twilio_router#incoming_message' #only for testing connectivity
  devise_for :users
  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
    get 'conversations_dashboard', to: 'conversations#dashboard'
    get 'unread_conversations', to: 'conversations#unread'
    get 'messages_dashboard', to: 'messages#dashboard'
    get 'unread_messages', to: 'messages#unread'
    get 'contests_dashboard', to: 'contests#dashboard'
    get 'current_contests', to: 'contests#current'
    get 'expired_contests', to: 'contests#expired'
    get 'surveys_dashboard', to: 'surveys#dashboard'
    get 'active_surveys', to: 'surveys#active'
    get 'contacts_dashboard', to: 'contacts#dashboard'
    get 'deleted_contacts', to: 'contacts#deleted'
    get 'settings_dashboard', to: 'settings#dashboard'
    post 'send_message_from_conversation', to: 'messages#send_message_from_conversation'
    resources :my_numbers
    resources :conversations
    resources :phone_numbers
    resources :survey_question_types
    resources :schedule_types
    resources :blast_types
    resources :contest_types
    resources :contacts
    resources :dashboard
    resources :messages
    resources :blasts
    resources :schedules
    resources :survey_question_responses
    resources :survey_questions
    resources :contests
    resources :surveys do
      get 'add_question', to: 'survey_questions#add_question'
      resources :survey_questions
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "public_landing#index"
  get '*path', to: 'public_landing#index'
end
