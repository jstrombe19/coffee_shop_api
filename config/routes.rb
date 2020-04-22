Rails.application.routes.draw do
  resources :coffee_shops, except: [:new, :edit, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
