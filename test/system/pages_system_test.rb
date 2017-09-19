require 'test_helper'

class MessagesSystemTest < ActionDispatch::SystemTestCase
  test 'root' do
    visit '/'

    assert page.has_content? 'Pages#home'
  end

  test 'root about link' do
    visit '/'

    click_on 'About'

    assert page.has_content? 'Pages#about'
  end
end
