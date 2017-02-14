require 'test_helper'

class UsersIntegrationTest < ActionDispatch::IntegrationTest
  def john
    users :john
  end

  test 'edit profile success' do
    log_in_as :john

    click_on 'John'
    click_on 'Account'
    fill_in 'Name', with: 'Johnny'
    fill_in 'Email', with: 'johnny@example.com'
    click_button 'Update'

    assert page.has_content? 'Account updated successfully'

    first('a.password-toggle').click # Change Password
    fill_in 'user_current_password', with: 'password'
    fill_in 'user_password', with: 'whatever'
    click_button 'Update'

    assert page.has_content? 'Account updated successfully'
  end

  test 'edit profile failure - password' do
    log_in_as :john

    click_on 'John'
    click_on 'Account'
    fill_in 'Name', with: 'John' # For some reason the Account page won't load without this
    first('a.password-toggle').click # Change Password
    fill_in 'user_current_password', with: 'not-my-password'
    fill_in 'user_password', with: 'whatever'
    click_button 'Update'

    assert page.has_content? 'Incorrect password'

    first('a.password-toggle').click # Change Password
    fill_in 'user_current_password', with: 'password'
    fill_in 'user_password', with: '2-short'
    click_button 'Update'
    assert page.has_content? 'Password is too short'
  end

  test 'edit profile failure - name' do
    log_in_as :john

    click_on 'John'
    click_on 'Account'
    fill_in 'Name', with: ''
    click_button 'Update'

    assert page.has_content? "Name can't be blank"
  end

  test 'edit profile failure - email' do
    log_in_as :john

    click_on 'John'
    click_on 'Account'
    fill_in 'Email', with: ''
    click_button 'Update'

    assert page.has_content? "Email can't be blank"
  end

  test 'delete profile' do
    log_in_as :john

    click_on 'John'
    click_on 'Account'
    click_on 'Delete Account'
    page.driver.browser.switch_to.alert.accept

    assert page.has_content? 'Account deleted successfully'
    # assert_raise ActiveRecord::RecordNotFound do
    #   projects :one
    # end
  end
end
