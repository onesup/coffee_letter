CoffeeLetter::Application.routes.draw do

  get "users/index"
  get "dashboard/index"

  get "signup"  => "users#new", :as => "signup"
  get "logout"  => "sessions#destroy", :as => "logout"
  get "login"   => "sessions#new", :as => "login"
  match 'admin' => 'admin/dashboard#index', :via => :get, :as => "admin" 
  
  resources :users, :only => [:create, :new]
  resources :sessions
  resources :letters, except: [:destroy, :index]
  resources :billings

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :letters
    resources :billings, except: [:destroy]
    resources :users, except: [:destroy]
    resources :coupons, except: [:destroy]
    resources :products, except: [:destroy]
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
