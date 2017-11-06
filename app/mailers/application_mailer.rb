# Parent Mailer that all Mailers inherit
class ApplicationMailer < ActionMailer::Base
  default from: 'bootkit@example.com'
  layout 'mailer'
end
