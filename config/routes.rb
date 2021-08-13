Rails.application.routes.draw do

  get 'users_dashboards/index'
  get 'users_dashboards/edit'
  get 'users_dashboards/update'
  get 'mercado-pago/:id', to: 'carts#mercado_pago', as: 'mercado-pago'
  get 'payment_success', to: 'carts#payment_success', as: 'payment_success'
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
  resource :cart, only: [:show, :update] do
    get 'carts/:id/delete_item', to: 'carts#delete_item', as: 'delete_item'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
