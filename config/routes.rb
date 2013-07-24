CoffeeLetter::Application.routes.draw do
  get "main/index"

  resources :letters
  root :to => 'letters#index'

end
