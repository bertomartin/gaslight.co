source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '~> 4.0.0'
gem 'puma'
gem 'jquery-rails'
gem 'haml', '~> 4.0'
gem 'haml-rails'
gem 'high_voltage'
gem 'rails-backbone'
gem 'rack-rewrite'
gem 'pg'
gem 'decent_exposure'
gem 'stringex'
gem 'htmlentities'
gem 'rack-cors', require: 'rack/cors'
gem 'training_app', path: 'engines/training_app'
gem 'blog_app', path: 'engines/blog_app'

gem 'redcarpet', require: false
gem 'pygments.rb', require: false

gem 'foundation_rails_helper', github: 'sgruhier/foundation_rails_helper', ref: 'ed5b2903'
gem 'sentry-raven', git: 'https://github.com/getsentry/raven-ruby.git'

gem 'compass-rails', '2.0.alpha.0'
gem 'activeadmin',         github: 'gregbell/active_admin'

gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on', ref: '2f2768f8'
gem 'engagement',          github: 'gaslight/engagement', ref:'de1d7f0', require: false

# Gems used only for assets and not required
# in production environments by default.
gem 'coffee-rails', '~> 4.0.0'
gem 'sass-rails',   '~> 4.0.0'
gem 'uglifier', '~> 2.1.0'
gem 'zurb-foundation', '~> 4.0'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'konacha'
end

group :test do
  gem 'poltergeist'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers' , branch: 'dp-rails-four'
  gem 'launchy'
  gem 'database_cleaner'
end

group :staging, :production do
  gem 'rails_12factor'
end

group :production do
  gem 'asset_sync'
end

