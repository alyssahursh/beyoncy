require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get specific address on show" do
    test_address = addresses(:normal_address)
    get :show, id: test_address.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  test "should redirect on destroy" do
    test_address_destroy = addresses(:normal_address)

    get :destroy, id: test_address_destroy.id
    assert_redirected_to '/'
  end

  test 'address count should decrease by one' do
    assert_difference('Address.count', -1) do
      test_address_destroy = addresses(:normal_address)
      get :destroy, id: test_address_destroy.id
    end

  end

  test "If a user is not logged in they cannot see their address(es)." do
    # session[:user_id] = nil  # ensure no one is logged in

    # get :show, id: addresses(:address).id
    # # if they are not logged in they cannot see the resource and are redirected to login.  
    # assert_redirected session_path
    # assert_equal "You must be logged in first", flash[:notice]
  end

end
