require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  test 'user can log in successfully' do
    # OmniAuth.config.test_mode = true
    # OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    #     'provider' => 'github',
    #     'uid' => '12345678',
    #     'info' => {
    #       'email' => 'beckygoodhair@beckygoodhair.com',
    #       'name' => 'test',
    #       'image' => ''
    #     }
    # })
    # request.env['omniauth.env'] = OmniAuth.config.mock_auth[:github]

    # get :auth
  end 

  test 'can create a new user' do     
    # assert_difference('User.count', 1) do
    #   login_a_user
    #   assert_response :redirect
    #   # may need to update this path in future
    #   asert_redirected_to root_path
    # end
  end

  test 'it does NOT create a 2nd user if their is a second login in attempt from the same user' do
    # login_a_user
  

    # assert_no_difference('User.count') do
    #   login_a_user
    #   assert_response :redirect
    #   assert_redirected_to root_path
    
    # end
  end

  # user data uniqueness 

  # test "user addresses should be unique" do
  #   duplicate_adresses = @address.dup
  #   @address.save
  #   assert_not duplicate_address.valid?
  # end

  test "index_addresses_on_user_id should be unique" do
      # duplicate_index_addresses_on_user_id = @index_addresses_on_user_id.dup
      # @index_addresses_on_user_id.save
      # assert_not duplicate_index_addresses_on_user_id.valid?
    end

  # test 'user id (uid) should be unique' do
  #   user_id = @uid.dup
  #   @uid.save
  #   assert_not duplicate_uid.valid?
  # end

  test 'user can log out successfully' do 
    # @user = User.find(session[:user_id])
    # assert_nil set user session to nil [:user] == nilsession[:user_id]
    # assert_redirected_to login_fail_path
  end

end


















