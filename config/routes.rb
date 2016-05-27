Rails.application.routes.draw do
  root to: "welcome#index"

  get "/welcome", to: "welcome#index"

  get "/login", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :doodles
  resources :todos
  resources :lists
  resources :users

end
