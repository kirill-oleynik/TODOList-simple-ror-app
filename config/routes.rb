Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, path: '/', constraints: {subdomain: 'api'} do
  resources :tasks, only: [:create, :update, :destroy]
  end
end
