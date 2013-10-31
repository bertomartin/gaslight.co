class PagesController < ApplicationController
  include HighVoltage::StaticPage

  def about
    @featured_posts = BlogApp::Post.recent(2)
  end
end