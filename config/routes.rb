Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
    resources :inventories
    resources :vendors
    resources :products
    resources :categories
    resources :customers
    resources :brands
    root to: "users#index" # <--- Root route
  end
  get 'static_pages/dashboard'
  root 'static_pages#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
