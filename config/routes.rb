Rails.application.routes.draw do
  root to: "welcome#index"

  get "/welcome", to: "welcome#index"

  get "/How_to", to: "welcome#show", as: "info"
  get "/login", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create", as: "create_session"
  get "/logout", to: "sessions#destroy", as: "logout"

  get "/todos", to: "todos#index", as: "todos"
  resources :doodles
  resources :lists, shallow: true do
    resources :todos
    end
  resources :users
  #
  # get "/todos", to: "todos#index", as: "todos"
  # get "/lists/:id/todo/new", to: "todos#new", as: "new_todo"
  # post "/lists/:id/todos", to: "todos#create", as: "create_todo"
  # patch "/lists/:list_id/todo/:id", to: "todos#update", as: "update_todo"
  # get "/lists/:list_id/todo/:id/edit", to: "todos#edit", as: "edit_todo"
  # delete "/lists/:list_id/todo/:id", to: "todos#destroy", as: "delete_todo"
  #

end
