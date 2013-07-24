CoffeeLetter::Application.routes.draw do
  get "main/index"

  resources :letters
  root :to => 'main#index'

end
