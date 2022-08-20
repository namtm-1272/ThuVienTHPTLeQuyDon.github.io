Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/login'
  get "/books", to: "books#index"
  get 'books/show'
  get 'books/create'
  get 'books/destroy'
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  delete '/logout', to: 'sessions#destroy'
  get "/search", to: "books#search"
  post "users", to: "users#update"

  resources :users
  resources :books
  namespace :admin do
    root to: "accounts#index"
    get "/admin", to: "accounts#index"
    get "/accounts", to: "accounts#index"
    post "/accounts/:id", to: "accounts#update"
    get "/books", to: "books#index"
    post "/books/:id", to: "books#update"
    get "/add_book", to: "books#new"
    post "/add_book", to: "books#create"
    get "/add_class", to: "class_users#new"
    post "/add_class", to: "class_users#create"
    post "/class_user/:id/edit", to: "class_users#update"
    resources :static_pages
    resources :books
    resources :accounts
    resources :class_users
  end
end
