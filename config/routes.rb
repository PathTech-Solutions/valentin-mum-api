Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"
  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :update, :destroy, :create]
      resources :answers, only: [:index, :update, :destroy, :create]
      resources :questions, only: [:index, :update, :destroy, :create]
      resources :questionnaires, only: [:index, :update, :destroy, :create]
      resources :sessions, only: [:index, :update, :destroy, :create]
      resources :scopes, only: [:index, :update, :destroy, :create]
      resources :given_answers, only: [:index, :update, :destroy, :create]
      resources :session_users, only: [:index, :update, :destroy, :create]
    end
  end
end
