require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  test 'can create a new user' do     
    assert_difference('User.count', 1) do
      login_a_user
      assert_resonse :redirect
      # may need to update this path in future
      asert_redirected_to root_path
    end
  end

  test 'it does NOT create a 2nd user if their is a second login in attempt from the same user' do
    login_a_user
  

    assert_no_difference('User.count') do
      login_a_user
      assert_resonse :redirect
      assert_redirected_to root_path
    end
  end
end
