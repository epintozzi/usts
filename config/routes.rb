Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'

  resources :races, only: [:index, :new, :create, :show]

  resources :users, except: [:destroy]

  resources :boat_classes, only: [:new, :create, :edit, :update, :index]

  resources :registrations, except: [:destroy]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/logout', to: "sessions#destroy"
end
