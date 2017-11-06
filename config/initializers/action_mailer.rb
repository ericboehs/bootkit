if ENV['SENDGRID_USERNAME'] && ENV['SENDGRID_PASSWORD']
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    authentication: :plain,
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: ENV.fetch('SENDGRID_DOMAIN', 'heroku.com'),
    enable_starttls_auto: true
  }

  ActionMailer::Base.delivery_method = :smtp
end

ActionMailer::Base.default_url_options = { host: ENV.fetch('APP_URI', 'localhost:3000') }
