Gaslight::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  get '/contact', to: 'contact#new'
  resource :contact, controller: :contact, only: :create

  resources :authors, only: :index
  resources :posts, path: '/blog', except: :show do
    collection do
      get "/:year(/:month(/:day))" => "posts#for_date", constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }
      get :search
      get :archive
    end

    member do
      get :podcast_iframe
    end
  end

  get 'blog/:slug', to: 'posts#show'
  get 'post/:id(/:slug)', to: 'posts#old' # handle old tumblr urls

  get 'sitemap.xml' => 'sitemaps#index', as: 'sitemap', defaults: { format: "xml" }

  root to: 'high_voltage/pages#show', id: 'home'

  get "/404", to: "errors#not_found"
  get "/500", to: "errors#server_error"
end
