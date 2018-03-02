Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/dashboard'
  root 'static_pages#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
