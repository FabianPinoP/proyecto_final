Rails.application.routes.draw do
  resources :parkings
  devise_for :users

  root 'parkings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
