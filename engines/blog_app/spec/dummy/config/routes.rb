Rails.application.routes.draw do

  mount BlogApp::Engine => "/blog_app"
end
