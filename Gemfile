source 'https://rubygems.org'

ruby '2.3.3'

gem 'rails', '5.0.1'

gem 'bcrypt',     '~> 3.1.0'   # Use ActiveModel has_secure_password
gem 'pg',         '~> 0.18.0'  # Postgres Database adapter for ActiveRecord
gem 'puma',       '~> 3.6.0'   # Fast, threaded web server

# Assets
gem 'jquery-rails',   '~> 4.2.0'  # Use jquery as the JavaScript library
gem 'sass-rails',     '~> 5.0.0'  # Sass CSS Preprocessor
gem 'turbolinks',     '~> 5.0.0'  # Turbolinks for fast navigation
gem 'uglifier',       '~> 3.0.0'  # Compressor for JavaScript assets

group :development do
  gem 'spring' # Preload rails into memory
end

group :development, :test do
  gem 'pry-awesome_print'  # Auto AP in pry
  gem 'pry-rails'          # Adds pry, an interactive REPL debugger; Try show-models
  gem 'rubocop'            # Ruby Style Guide Analyzer
end

group :test do
  gem 'capybara'            # Acceptance testing
  gem 'minitest'            # Inlcude the latest version of minitest
  gem 'selenium-webdriver'  # Capybara system testing with Chrome; be sure to: brew install chromedriver
end
