require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  test 'sign up success' do
    visit '/signup'
    fill_in 'Name', with: 'John Auth'
    fill_in 'Email', with: 'john_auth@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign Up'

    assert User.find_by(email: 'john_auth@example.com')
    assert page.has_content? 'Account created successfully'
    assert_equal current_path, '/'
  end

  test 'sign up failure' do
    visit '/signup'
    # fill_in 'Password', with: 'pass'
    click_button 'Sign Up'

    # TODO: Make sure name, email and password present; password >8
    # assert page.has_content? "Name can't be blank"
    # assert page.has_content? "Email can't be blank"
    # assert page.has_content? "Password too short"
    assert page.has_content? "Password can't be blank"
    assert_equal current_path, '/users'
  end

  test 'log in success' do
    visit '/login'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    assert_equal current_path, '/'
    assert page.has_content? 'Logged in successfully'
  end

  test 'log in failure' do
    visit '/login'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'bad_password'
    click_button 'Log in'

    assert_equal current_path, '/login'
    assert page.has_content? 'Invalid email or password'
  end

  test 'password reset request success' do
    visit '/login'
    click_on 'Forgot password?'
    assert_equal current_path, '/password_resets/new'
    fill_in 'Email', with: 'john@example.com'
    click_button 'Reset Password'
    assert_equal current_path, '/'
    assert page.has_content? 'Email sent with password reset instructions.'

    sleep 0.1 until mail = ActionMailer::Base.deliveries.last
    assert_equal ['john@example.com'], mail.to
    assert_equal 'Password Reset Instructions', mail.subject
    assert_match 'Reset Password', mail.body.encoded
  end

  test 'password reset success' do
    visit '/password_resets/abc123_john/edit'
    fill_in 'New Password', with: 'newpassword'
    click_button 'Change Password'
    assert_equal current_path, '/'
    assert page.has_content? 'Password has been reset!'
  end
end
