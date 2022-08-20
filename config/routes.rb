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
  post "users", to: "users#update"

  resources :users
  resources :books
  namespace :admin do
    root to: "users#index"
    get "/admin", to: "users#index"
    get "/books", to: "books#index"
    post "/books/:id", to: "books#update"
    get "/add_book", to: "books#new"
    post "/add_book", to: "books#create"
    get "/add_class", to: "class_users#new"
    post "/add_class", to: "class_users#create"
    get "/add_user", to: "users#new"
    post "/add_user", to: "users#create"
    resources :static_pages
    resources :books
    resources :users
    resources :class_users
  end
end
