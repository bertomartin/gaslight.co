class SitemapsController < ApplicationController
  respond_to :xml

  expose(:posts) { BlogApp::Post.published.by_publish_date }
  expose(:static_pages) { %w{about coffee contact home live work} }

  def index
    respond_with posts
  end
end

