CoffeeLetter::Application.routes.draw do
  resources :billings


  get "main/index"

  resources :letters
  root :to => 'main#index'

end
