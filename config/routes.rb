CoffeeLetter::Application.routes.draw do

  get "logout"  => "sessions#destroy", :as => "logout"
  get "login"   => "sessions#new", :as => "login"

  resources :users, :only => [:create]
  resources :sessions
  resources :letters, except: [:destroy, :index]
  resources :billings
  namespace :admin do
    resources :letters
  end
  
  get "main/index"
  root :to => 'main#index'
end
