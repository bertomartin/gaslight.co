TrainingApp::Engine.routes.draw do
  #ActiveAdmin.routes(self)
  #devise_for :admin_users, ActiveAdmin::Devise.config

  resources :workshops
  resources :courses, only: [:index, :show] do
    resources :registrations do
      get :stats, on: :collection
    end
  end

  root to: 'courses#index'
end
