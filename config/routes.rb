Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
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

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
