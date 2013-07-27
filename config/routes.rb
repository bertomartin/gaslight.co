Gaslight::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

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

  # catch all the pages
  get '/:id', to: 'pages#show', as: :static
  get '/home', to: 'pages#show', id: 'home', as: :home

  # redirect to /home. Lets the app rewrite requests
  # and caches the page(s).
  root to: 'pages#show', id: 'home'
end
