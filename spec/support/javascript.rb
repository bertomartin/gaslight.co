require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app)
end

# Can also use JS_DRIVER=selenium rspec spec/...
Capybara.javascript_driver = ENV.fetch("JS_DRIVER", "poltergeist").to_sym

