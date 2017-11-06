# Parent Controller that all Controllers inherit
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include AuthenticationHelpers
end
