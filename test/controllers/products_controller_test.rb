require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should load a specific product on show' do
    test_product = products(:normal_product)
    get :show, id: test_product.id
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

  test "should redirect on products destroy" do
    test_product_destroy = products(:normal_product) 
    get :destroy, id: test_product_destroy.id
    assert_redirected_to '/'
  end

end
