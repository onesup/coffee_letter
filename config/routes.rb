CoffeeLetter::Application.routes.draw do

  get "signup" => "users#new", :as => "signup"

  get "logout"  => "sessions#destroy", :as => "logout"
  get "login"   => "sessions#new", :as => "login"

  resources :users, :only => [:create, :new]
  resources :sessions
  resources :letters, except: [:destroy, :index]
  resources :billings

  namespace :admin do
    resources :letters
  end

  resources :users do
    scope module: :user do 
      resources :letters, except: [:destroy]
      resources :billings, except: [:destroy, :new]
      resources :main, only: [:index]
    end
  end

  get "main/index"
  root :to => 'main#index'
end
