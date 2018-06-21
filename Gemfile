# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use PostgreSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'hashie'
gem 'octokit'
gem 'omniauth-github'
gem 'parallel'
gem 'redis-rails'
gem 'slim-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'

  gem 'pry-rails'
  gem 'rails_best_practices', require: false
  gem 'rubocop', require: false
  gem 'spring-commands-rspec'
  gem 'spring-commands-rubocop'
end

group :test do
  gem 'capybara'
  gem 'pry-byebug'
  gem 'rack_session_access'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Appended by deppbot for the security issue
gem 'nokogiri', '>= 1.7.2'
