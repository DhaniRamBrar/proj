Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'products/:id', to: 'home#show', as: :product
  devise_for :admins
  devise_for :users, path: '', controllers: { registrations: 'users/registrations' }, path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :orders, only: [:create]
  resources :categories do
    get 'products', on: :member
  end

  authenticated :user do
    get 'profile', to: 'users#show'
  end

  resource :user, only: [:show, :update]
  get '/pages/:slug', to: 'static_pages#show', as: :static_page
  resource :cart, only: [:show] do
    post 'add', on: :collection
    post 'update_quantity', on: :collection
    delete 'remove', on: :collection
  end
  get 'order_summary', to: 'orders#summary', as: 'order_summary'
  post 'orders/create', to: 'orders#create', as: 'orders_create'
  get 'orders', to: 'orders#index', as: 'index_orders'

  # namespace :admin do
  #   get 'dashboard/index'
  #   devise_for :admins, skip: :registrations
  #   root to: "products#index"
  #   resources :products
  #   resources :categories
  #   resources :users, only: [:index]
  #   resources :orders, only: [:index, :show, :destroy]
  # end
  resources :products, only: [:show]
  root 'home#index'
  get 'home/sale', to: 'home#sale'
  get 'home/new', to: 'home#new', as: 'home_new'
  get "up" => "rails/health#show", as: :rails_health_check
  get 'tax_rates/:province_id', to: 'taxes#rates', as: 'tax_rates'
end
