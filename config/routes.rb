Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
    resources :inventories
    resources :vendors
    resources :products
    resources :categories
    resources :brands
    resources :addresses
    resources :groups
    resources :style_attributes
    resources :orders
    resources :order_entries
    root to: "users#index" # <--- Root route
  end
  #API Simple

  namespace :api do
    namespace :simple do
      resources :users do
        get 'list', on: :collection
      end
      resources :categories do
        get 'list', on: :collection
      end
      resources :addresses do
        get 'list', on: :collection
      end
      resources :brands do
        get 'list', on: :collection
        get 'details', to: :display
      end
      resources :groups do
        get 'list', on: :collection
      end
      resources :inventories do
        get 'list', on: :collection
        get 'overall', on: :collection
      end
      resources :products do
        get 'list', on: :collection
      end
      resources :vendors do
        get 'list', on: :collection
      end
      resources :style_attributes do
        get 'list', on: :collection
      end
      resources :orders do
        get 'list', on: :collection
      end
      resources :order_entries do
        get 'list', on: :collection
      end
    end
  end
  get 'static_pages/dashboard'
  root 'static_pages#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
