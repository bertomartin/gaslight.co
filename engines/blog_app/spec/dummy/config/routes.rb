Rails.application.routes.draw do
  mount BlogApp::Engine => "/blog"

  mount Jasminerice::Engine => "/jasmine"
  get "/jasmine/:suite" => "jasminerice/spec#index"
end
