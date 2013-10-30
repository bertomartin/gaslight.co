Rails.application.routes.draw do
  mount BlogApp::Engine => "/blog"
end
