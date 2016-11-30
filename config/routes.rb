# frozen_string_literal: true
Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  get '/games' => 'games#index'
  post '/games', to: 'games#create'
  # POST request from /books send to the books controller, use the create action
  get '/games/:id', to: 'games#show'
  # GET request from /books send to the books controller, use the show action
  patch '/games/:id', to: 'games#update'
  delete '/games/:id', to: 'games#destroy'
end
