Rails.application.routes.draw do
  resources :coffees, except: [:new, :edit]
  resources :coffee_shops, except: [:new, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
