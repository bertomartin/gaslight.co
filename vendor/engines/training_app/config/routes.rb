TrainingApp::Engine.routes.draw do
  #ActiveAdmin.routes(self)
  #devise_for :admin_users, ActiveAdmin::Devise.config

  resources :workshops
  resources :registrations do
    get :stats, on: :collection
  end

  root to: 'registrations#index'
end
