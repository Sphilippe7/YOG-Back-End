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
  get '/games/:id', to: 'games#show'
  patch '/games/:id', to: 'games#update'
  delete '/games/:id', to: 'games#destroy'
end
