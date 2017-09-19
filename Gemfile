source 'https://rubygems.org'

ruby '~> 2.4'

gem 'rails', '~> 5.1.4'

gem 'pg',         '~> 0.21.0' # Postgres Database adapter for ActiveRecord
gem 'puma',       '~> 3.10.0' # Fast, threaded web server
gem 'sass-rails', '~> 5.0.0'  # Sass CSS Preprocessor
gem 'turbolinks', '~> 5.0.0'  # Turbolinks for fast navigation
gem 'uglifier',   '~> 3.2.0'  # Compressor for JavaScript assets

group :development do
  gem 'spring' # Preload rails into memory
end

group :development, :test do
  gem 'pry-awesome_print'  # Auto AP in pry
  gem 'pry-rails'          # Adds pry, an interactive REPL debugger; Try show-models
  gem 'rubocop'            # Ruby Style Guide Analyzer
end

group :test do
  gem 'capybara'           # Acceptance testing
  gem 'minitest'           # Include the latest version of minitest
  gem 'selenium-webdriver' # Capybara system testing with Chrome
end
