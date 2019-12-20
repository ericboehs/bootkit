# frozen_string_literal: true

# Base class for mailers to inherit from
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
