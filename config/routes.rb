Rails.application.routes.draw do
  get 'users/new'
  get 'user/new'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/login'
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  resources :users
  namespace :admin do
    root to: "static_pages#home"
    resources :static_pages
  end
end
