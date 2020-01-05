# frozen_string_literal: true

Rails.application.routes.draw do
  # Session
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root to: 'pages#home'
end
