Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'dashboard#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'admin', to: 'admin#index'
      devise_for :users
      post '/login', to: 'authentication#authenticate'
      post '/signup', to: 'users#create'
      get '/profile', to: 'users#profile'
    end
  end
end
