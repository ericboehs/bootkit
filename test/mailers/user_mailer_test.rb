require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def john
    users :john
  end

  test 'password_reset' do
    mail = UserMailer.password_reset john
    assert_equal 'Password Reset Instructions', mail.subject
    assert_equal ['john@example.com'], mail.to
    assert_equal ['bootkit@example.com'], mail.from
    assert_match 'Reset Password', mail.body.encoded
    assert_match 'password_resets/abc123_john/edit', mail.body.encoded
  end
end
