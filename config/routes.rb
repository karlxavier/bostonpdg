Rails.application.routes.draw do
  devise_for :users
  post 'vendors/import_csv'
  post 'customers/import_csv'
  resources :orders do
    collection do
      post  'update_assign_user'
      post  'update_order'
    end
  end
  resources :inventories do
    collection do
      get   'add_item'
      get   'manage_by_hotel'
      get   'view_stocks'
      get   'show_brand'
    end
  end

  resources :vendors do
    collection do
      get   'add'
      get   'list'
    end
  end

  resources :order_entries do
    collection do
      post  'update_entry'
    end
  end

  resources :chatroom_orders do
    resources :order_users
    resources :messages
    resources :dropfiles, only: :create
    get 'load_messages/', :to => 'chatroom_orders#load_messages', as: 'load_messages'
  end

  resources :orders do
    resources :products do
      resources :item_messages
    end
    get 'item_details/:id', :to => 'products#item_details', as: 'item_details'
  end


  namespace :admin do
    resources :users
    resources :users_brands
    resources :users_groups
    resources :customers
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
    resources :vendors_products
    resources :vendor_categories
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
        get 'get_products_category', on: :collection
        post 'create_item', on: :collection
        post 'update_product', on: :collection
      end
      resources :vendors do
        get 'list', on: :collection
        get 'get_vendors_products', on: :collection
        get 'get_category_vendors', on: :collection
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
  root 'orders#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
