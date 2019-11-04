Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'dashboard#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'admin', to: 'admin#index'
    end
  end
end
