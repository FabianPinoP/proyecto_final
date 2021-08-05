Rails.application.routes.draw do
  resources :parkings
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  delete '/users/:id', to: 'dashboards#destroy', as: :destroy_user
  get 'users/:id', to: 'dashboards#update_status', as: :update_status

  get 'dashboard/', to: 'dashboards#index'
  get 'public_parkings/', to: 'dashboards#parking'

  get 'about', to: 'home#index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
