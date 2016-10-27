require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  test 'user can log in successfully' do
    
    login_a_user

    # get :show, :id, 'auth/github/sessions'  
    assert_response :success 
  end 

  test 'it does NOT create a 2nd user if their is a second login in attempt from the same user' do
    login_a_user

    assert_no_difference('User.count') do
      login_a_user
      assert_response :success
    end
  end

  # user data uniqueness (testing individual data elements)

  # test "user addresses should be unique" do
  #   login_a_user
  #   duplicate_address = login_a_user.address
  #   assert_not duplicate_address.valid?
  # end

  # test "index_addresses_on_user_id should be unique" do
  #     duplicate_index_addresses_on_user_id = @index_addresses_on_user_id.dup
  #     @index_addresses_on_user_id.save
  #     assert_not duplicate_index_addresses_on_user_id.valid?
  #   end

  # test 'user id (uid) should be unique' do
  #   user_id = @uid.dup
  #   @uid.save
  #   assert_not duplicate_uid.valid?
  # end
  
  # this one was too straight forward, am I testing what I think I'm testing.
  test 'user can log out successfully' do 
    login_a_user
    session.destroy
    assert_nil session[:user_id]
  end

end


















