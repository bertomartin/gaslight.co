TrainingApp::Engine.routes.draw do
  resources :courses, only: [:index, :show] do
    resources :registrations do
      get :stats, on: :collection
    end
  end

  namespace :api, defaults: {format: :json} do
    resources :courses
    resources :sections
    resources :chapters
  end

  root to: 'courses#index'
end
