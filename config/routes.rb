CoffeeLetter::Application.routes.draw do

  get "billings/index"

  get "billings/new"

  get "billings/edit"

  get "letters/index"

  get "letters/new"

  get "letters/edit"

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
    end
  end

  get "main/index"
  root :to => 'main#index'
end
