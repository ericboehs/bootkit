# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.5'

gem 'rails', '~> 6.0.0'

gem 'bootsnap',    '~> 1.4.5', require: false # Reduces boot times through caching
gem 'pg',          '~> 1.1.0' # Postgres Database adapter for ActiveRecord
gem 'puma',        '~> 4.3.0' # Fast, threaded web server
gem 'sassc-rails', '~> 2.1.0' # SassC CSS Preprocessor
gem 'turbolinks',  '~> 5.2.0' # PJAX-like fast page navigation
gem 'webpacker',   '~> 4.2.0' # Transpile app-like JavaScript

group :development do
  gem 'spring' # Preload rails into memory
end

group :development, :test do
  gem 'pry-awesome_print' # Auto AP in pry
  gem 'pry-rails'         # Adds pry, an interactive REPL debugger; Try show-models
  gem 'rubocop'           # Ruby Style Guide Analyzer
  gem 'rubocop-rails'     # Add Rails specific cops to RuboCop
end

group :test do
  gem 'capybara'           # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver' # Capybara system testing with Chrome
  gem 'webdrivers'         # Easy installation and use of web drivers to run system tests with browsers
end
