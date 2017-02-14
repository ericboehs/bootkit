ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'pry-rescue/minitest' if ENV['PRY_RESCUE_RAILS']

# NOTE: This will be the default in Rails 5.1
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome).tap do |driver|
    driver.browser.manage.window.size = Selenium::WebDriver::Dimension.new 1400, 1400
  end
end

Capybara.default_driver = :selenium

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    save_screenshot unless passed?
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def log_in_as name
    visit "#{login_path}?token=#{users(name).perishable_token}"
  end

  def open_screenshot
    `open #{save_screenshot}`
  end

  def open_page
    `open #{save_page}`
  end

  def open_path
    `open http://localhost:#{Capybara.current_session.server.port}#{current_path}`
  rescue
    warn 'Capybara server not running; try `open_page` instead.'
  end
end

Dir[File.expand_path 'helpers/**/*.rb', __dir__].each { |f| require f }
