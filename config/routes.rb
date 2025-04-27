Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :programs, only: [:index, :show]
      resources :activities, only: [:index, :show]
      resources :daily_plans, only: [:index, :show]
      resources :user_activities, only: [:create, :update]
      resources :user_programs, only: [:index, :create]
      
      # Additional route to get daily plan for specific day
      get '/programs/:program_id/day/:day_number', to: 'daily_plans#show_by_day'
      
      # Route to get user progress
      get '/users/:user_id/progress', to: 'user_programs#progress'
    end
  end
end