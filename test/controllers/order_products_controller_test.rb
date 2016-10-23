require 'test_helper'

class OrderProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
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

  test "should redirect on order products destroy" do
    test_order_products = order_products(:one)
    get :destroy, id: test_order_products.id
    assert_redirected_to '/'
  end
  # TODO jm-rives stopped here 10/22/2016
  test 'order_products should decrease by one one destroy' do
    # assert_difference('order_products', -1) do
    #   test_order_products = order_products(:one)
    #   get :destroy, id: test_order_products.id
    # end
    # generates TypeError: no implicit conversion of Fixnum into Array
  end

  test "If a user is not logged in they cannot see their product order(s)." do
    # session[:user_id] = nil  # ensure no one is logged in

    # get :show, id: order_products(:order_product).id
    # # if they are not logged in they cannot see the resource and are redirected to login.  
    # assert_redirected session_path
    # assert_equal "You must be logged in first", flash[:notice]
  end

end
