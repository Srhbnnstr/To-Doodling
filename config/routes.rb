Rails.application.routes.draw do
  root to: "welcome#index"

  get "/welcome", to: "welcome#index"

  get "/How_to", to: "welcome#show", as: "info"
  get "/login", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create", as: "create_session"
  get "/logout", to: "sessions#destroy", as: "logout"
  resources :doodles
  resources :todos
  resources :lists
  resources :users

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
