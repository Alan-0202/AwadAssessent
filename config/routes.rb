Rails.application.routes.draw do

  resources :purchases
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :movies
  resources :countries
  resources :fictions
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  post 'countries/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
