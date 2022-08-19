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

  namespace :admin do
    root to: "static_pages#index"
    get "/admin", to: "static_pages#index"
    get "/accounts", to: "accounts#index"
    get "/books", to: "books#index"
    get "/add_book", to: "books#new"
    post "/add_book", to: "books#create"

    resources :static_pages
    resources :books
    resources :accounts
  end
end
