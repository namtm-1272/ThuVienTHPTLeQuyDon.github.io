Rails.application.routes.draw do
  get 'users/new'
  get 'users/show'
  get 'users/create'
  get 'users/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/login'
  get "/books", to: "books#show"
  get 'books/show'
  get 'books/create'
  get 'books/destroy'
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  delete '/logout', to: 'sessions#destroy'

  resources :users
  namespace :admin do
    root to: "static_pages#index"
    get "/admin", to: "static_pages#index"
    get "/accounts", to: "static_pages#account_list"
    get "/books", to: "static_pages#book_list"
    get "/add-book", to: "static_pages#add_book"
    post "/add-book", to: "static_pages#create_book"
    resources :static_pages
  end
end
