TrainingApp::Engine.routes.draw do
  #ActiveAdmin.routes(self)
  #devise_for :admin_users, ActiveAdmin::Devise.config

  resources :workshops
  resources :courses, only: [:index, :show] do
    resources :registrations do
      get :stats, on: :collection
    end
  end

  namespace :api, defaults: {format: :json} do
    resources :sections
    resources :chapters
  end

  root to: 'courses#index'
end