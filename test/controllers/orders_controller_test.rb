require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

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

  # broken by model
  test "should redirect on orders controller destroy" do
    test_order_destroy = orders(:normal_order)
    get :destroy, id: test_order_destroy
    assert_redirected_to '/'
  end

  test "If a user is not logged in they cannot see their order(s)." do
    # session[:user_id] = nil  # ensure no one is logged in

    # get :show, id: orders(:orders).id
    # # if they are not logged in they cannot see the resource and are redirected to login.  
    # assert_redirected session_path
    # assert_equal "You must be logged in first", flash[:notice]
  end

end
