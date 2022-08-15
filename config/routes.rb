Rails.application.routes.draw do
  get 'students/new'
  get 'students/create'
  get 'students/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
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

  resources :students, only: %i(new create show)
  resources :admins
end
