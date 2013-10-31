BlogApp::Engine.routes.draw do
  resources :posts, path: '/', except: :show do
    collection do
      get "/:year(/:month(/:day))" => "posts#for_date", constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }
      get :search
      get :archive
    end

    member do
      get :podcast_iframe
    end
  end

  resources :authors, only: :index

  get '/rss', to: 'posts#index', format: "rss"
  get ':slug', to: 'posts#show'


  root to: 'posts#index'
end
