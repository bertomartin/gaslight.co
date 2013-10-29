require "haml"
require "haml-rails"
require "decent_exposure"
require "sass-rails"
require "compass-rails"

module BlogApp
  class Engine < ::Rails::Engine
    isolate_namespace BlogApp

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
