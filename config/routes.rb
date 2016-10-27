Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'

  resources :races, only: [:index, :show]

  namespace :admin do
    resources :races, except: [:destroy]
  end

  resources :users, except: [:destroy]

  namespace :admin do
    resources :boat_classes, only: [:new, :create, :edit, :update, :index]
  end

  resources :registrations, except: [:destroy]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/logout', to: "sessions#destroy"
end
