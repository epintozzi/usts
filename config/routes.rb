Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :races, only: [:index, :new, :create, :show]

  resources :users, except: [:destroy]

  resources :boat_classes, only: [:new, :create, :edit, :update, :index]

end
