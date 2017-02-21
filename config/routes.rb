Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'badguests#index'
  
  resources :badguests

  get '/search', to: 'badguests#search'

  get '/history', to: 'badguests#history'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :stores, only: [:new, :create]

  get '/register', to: 'stores#new'


end
