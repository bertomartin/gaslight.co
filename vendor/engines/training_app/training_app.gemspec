$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "training_app/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "training_app"
  s.version     = TrainingApp::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TrainingApp."
  s.description = "TODO: Description of TrainingApp."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "eco"
  s.add_dependency "stripe"
  s.add_dependency "decent_exposure"
  s.add_dependency "haml", '~> 4.0'
  s.add_dependency "haml-rails"

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-given'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "shoulda-matchers", "~> 2.4.0.rc1"
  s.add_development_dependency "pry"
end
