Rails.application.routes.draw do
  # User
  resources :users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/account' => 'users#show'

  # Session
  resources :password_resets
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Static Pages
  get '/about', to: 'pages#about'

  # Root
  root to: 'pages#home'
end
