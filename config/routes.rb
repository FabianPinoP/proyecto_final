Rails.application.routes.draw do

  get 'users_dashboards/index'
  get 'users_dashboards/edit'
  get 'users_dashboards/update'
  resources :parkings do
    member do
      patch "like", to: "parkings#like"
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  delete '/users/:id', to: 'dashboards#destroy', as: :destroy_user
  get 'users/:id', to: 'dashboards#update_status', as: :update_status
  

  get 'dashboard/', to: 'dashboards#index'
  get 'public_parkings/', to: 'dashboards#parking'

  get 'about', to: 'home#index'

  root 'home#index'
  resource :cart, only: [:show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
