# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    john = User.find_by email: 'john@example.com'
    UserMailer.password_reset john
  end
end
