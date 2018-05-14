Rails.application.routes.draw do
  devise_for :users


  namespace :admin do
    resources :users
    resources :users_brands
    resources :users_groups
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
    resources :order_users
    resources :order_branches
    root to: "users#index" # <--- Root route
  end
  #API Simple
  namespace :api do
    namespace :simple do
      resources :users do
        get 'list', on: :collection
        get 'branch_users', on: :collection
        get 'login', on: :collection
        get 'forgot_password', on: :collection
      end
      resources :categories do
        get 'list', on: :collection
      end
      resources :addresses do
        get 'list', on: :collection
        get 'branches', on: :collection
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
        get 'get_item_list', on: :collection
      end
      resources :vendors do
        get 'list', on: :collection
      end
      resources :style_attributes do
        get 'list', on: :collection
      end
      resources :orders do
        get 'list', on: :collection
        get 'send_orders', on: :collection
        get 'show_entries', on: :collection
        get 'show_users', on: :collection
        get 'get_latest_order', on: :collection
        get 'show_branches', on: :collection
        post 'update_assign_user'
      end
      resources :order_entries do
        get 'list', on: :collection
      end
      resources :sessions do
      end
    end
  end
  get 'static_pages/dashboard'
  root 'admin/users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
