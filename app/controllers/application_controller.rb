# frozen_string_literal: true

# Main Application Controller
class ApplicationController < ActionController::Base
  include Authenticatable
end
