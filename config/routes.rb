Rails.application.routes.draw do
  root to: "welcome#index"

  get "/welcome", to: "welcome#index"

  get "/How_to", to: "welcome#show", as: "info"
  get "/login", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"
  resources :doodles
  resources :todos
  resources :lists
  resources :users

end
