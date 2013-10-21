class PagesController < ApplicationController
  include HighVoltage::StaticPage

  def about
    @featured_posts = Post.recent(2)
  end
end