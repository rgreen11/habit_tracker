Rails.application.routes.draw do 
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#index"
  get "pages/index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # api habits
  get "/habits", to: "habits#index"
  get "/habits/new", to: "habits#new"
  post "/habits", to: "habits#create"
  # api habit logs
  get "/habit_logs", to: "habit_logs#index"
  get "/habit_logs/new", to: "habit_logs#new"
  post "/habit_logs", to: "habit_logs#create"
  post "/quick_check_in", to: "habit_logs#quick_check_in"
end
