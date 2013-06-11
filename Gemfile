source 'https://rubygems.org'

gem 'spree', '2.0.0'

# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', :branch => '2-0-stable'

group :test do
  gem 'therubyracer', :platforms => :ruby
  gem 'capybara'
  gem 'capybara-screenshot', :require => false
  gem 'capybara-mechanize'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails', '~> 4.2'
end

gemspec
