CoffeeLetter::Application.routes.draw do
  resources :letters
  root :to => 'letters#index'

end
