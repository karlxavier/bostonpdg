Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  root 'users/user_time_logs#index'

  # get 'patients/sign_out' => "patients/sessions#destroy"
  devise_for :patients,
             path: 'patients',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout'
             },
             controllers: {
               sessions: 'patients/sessions',
               registrations: 'patients/registrations',
               passwords: 'patients/passwords'
             }
  
  devise_for :users,
             path: 'users',
             path_names: {
              sign_in: 'login',
              sign_out: 'logout'
            },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               passwords: 'users/passwords'
             }
  
  devise_scope :user do
              authenticated :user do
                root 'user_time_logs#index', as: :authenticated_root
              end
          
              unauthenticated do
                root 'users/sessions#new', as: :unauthenticated_root
              end
  end

  post 'vendors/import_csv'
  post 'customers/import_csv'
  post 'admin/hotels/import_csv'
  post 'admin/products/import_csv'
  post 'admin/categories/import_csv'
  post 'admin/inventories/import_csv'
  post 'admin/user_time_logs/import_csv'

  namespace :users do
    root 'users/user_time_logs#index'
    resources :user_time_logs do
      get :autocomplete_default_work_description, :on => :collection
    end
    resources :users, only: [:show, :index]
    resources :dashboards, only: [:index, :show]

    get 'timelog_report', :to => 'user_time_logs#timelog_report', as: 'timelog_report'
    get 'get_start_second', :to => 'user_time_logs#get_start_second', as: 'get_start_second'
    get 'load_notifications', :to => 'notifications#load_notifications', as: 'load_notifications'
    get 'request_timelog_update/:timelog_id', :to => 'user_requests#request_timelog_update', as: 'request_timelog_update'
    get 'execute_new_timelog/:request_id', :to => 'user_requests#execute_new_timelog', as: 'execute_new_timelog'
    get 'execute_edit_timelog/:request_id', :to => 'user_requests#execute_edit_timelog', as: 'execute_edit_timelog'

    post 'execute_create_timelog', :to => 'user_time_logs#execute_create_timelog', as: 'execute_create_timelog'
    get 'execute_update_timelog', :to => 'user_time_logs#execute_update_timelog', as: 'execute_update_timelog'

    resources :channels do
      resources :channel_users
      resources :messages
    end

    resources :user_requests, only: [:new, :create, :show]
    resources :notifications, only: [:index]
    resources :users, only: [:edit, :update]
    resources :document_uploads, only: [:index, :show]
    resources :search_results, only: :index
    resources :dynamic_messages, only: :show
    resources :dynamic_item_messages, only: :show
    resources :filter_notifications, only: :show
    resources :orders do
      collection do
        post  'update_assign_user'
        post  'update_order'
        get   'send_orders'
        post  'send_orders_to_vendors'
        get   'item_details'
      end
    end
    resources :products do
      collection do
        post  'change_picture'
      end
    end
    resources :inventories do
      collection do
        get   'add_item'
        get   'manage_by_hotel'
        get   'view_stocks'
        get   'show_brand'
        post  'create_item'
        post  'restock'
      end
    end

    resources :vendors do
      collection do
        get   'list'
        get   'add_item'
        get   'supplier'
        get   'products'
        get   'items'
      end
    end

    resources :order_entries do
      collection do
        post  'update_entry'
        post  'change_status'
        post  'change_status_on_checklist'
        get   'history'
        get   'attachment'
        post  'add_existing_item'
        get   'download_attachment'
        get   'list'
      end
    end

    resources :email_templates

    resources :chatroom_orders do
      resources :order_users
      resources :messages
      resources :dropfiles, only: :create
      get 'load_messages/', :to => 'chatroom_orders#load_messages', as: 'load_messages'

      resources :order_entries, only: :load_item_messages do
        get 'load_item_messages/', :to => 'chatroom_orders#load_item_messages', as: 'load_item_messages'
      end
      resources :order_entries, only: :index do
        resources :item_messages, only: [:create, :new]
      end
    end

    resources :orders do
      resources :products do
        resources :item_messages
      end
      get 'item_details/:id', :to => 'products#item_details', as: 'item_details'
      resources :messages
      get 'load_messages/:chatroom_id', :to => 'orders#load_messages', as: 'load_messages', on: :collection
      get 'cancel_msg_update/:id', :to => 'messages#cancel_msg_update', as: 'cancel_msg_update', on: :collection
    end

    resources :order_entries, only: :load_item_messages do
      get 'load_item_messages/', :to => 'orders#load_item_messages', as: 'load_item_messages'
    end
  end

  namespace :patients do
    root to: "dashboards#index"
    resources :patients, only: [:show, :edit, :update] do
      get 'confirm_me', on: :collection
      get 'verify_mobile', on: :collection, to: 'patients#verify_mobile', as: 'verify_mobile'
      get "verify", to: 'patients#verify', as: 'verify'
      resources :dashboards
      resources :document_uploads, only: [:index, :show] do
        get 'doc_preview'
      end
    end
  end

  namespace :admin do
    resources :user_requests
    resources :notifications
    resources :users do
      get 'group_assign', to: 'users_groups#group_assign', as: 'group_assign'
    end
    resources :document_uploads do
      get 'new_folder_root', on: :collection
      get 'new_folder_sub'
      get 'upload_files'
      get 'doc_preview'
      get 'edit_folder'
      get 'share_file'
    end
    resources :user_time_logs
    resources :users_brands
    resources :patients
    resources :offices
    resources :users_groups
    resources :users_group_details
    resources :customers
    resources :inventories
    resources :vendors do
      resources :vendor_reviews
    end
    resources :default_works
    resources :products
    resources :categories
    resources :addresses
    resources :groups
    resources :style_attributes
    resources :orders do
      get 'duplicate_order', :to => 'orders#duplicate_order', as: 'duplicate_order'
      get 'archive_order', :to => 'orders#archive_order', as: 'archive_order'
    end
    resources :archive_orders, only: [:index]
    resources :order_entries
    resources :order_users
    resources :order_branches
    resources :vendors_products
    resources :vendor_categories
    resources :default_templates
    resources :brands do
      resources :hotels, only: [:show]
    end
    resources :hotels do
      get 'compose_email', :to => 'hotels#compose_email', as: 'compose_email'
    end  
    
    root to: "dashboards#index" # <--- Root route
  end
  
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
        get 'vendor_email_list',  on: :collection
        get 'attachment_list',  on: :collection
        post 'destroy_attachment', on: :collection
      end
      resources :sessions do
      end
      resources :hotels do
      end
    end
  end
  get 'static_pages/dashboard'

  # config.exceptions_app = self.routes # a Rack Application

  # config/routes.rb
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # unless Rails.application.config.consider_all_requests_local
  #   # having created corresponding controller and action
  #   get '*path', to: 'errors#error_404', via: :all
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
