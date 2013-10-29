require "haml"
require "haml-rails"
require "decent_exposure"
require "sass-rails"
require "compass-rails"
require "acts-as-taggable-on"
require "stringex"
require "pygments"

module BlogApp
  class Engine < ::Rails::Engine
    isolate_namespace BlogApp

    ActsAsTaggableOn::Tagging.table_name = "blog_app_taggings"
    ActsAsTaggableOn::Tag.table_name = "blog_app_tags"

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
