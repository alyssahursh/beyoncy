require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should load specific category on show' do
    test_category = categories(:normal_category)
    get :show, id: test_category.id
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
  #   get :udpate
  #   assert_response :success
  # end

  test "should redirect on categories destroy" do
    test_category_destroy = categories(:normal_category)
    get :destroy, id: test_category_destroy.id
    assert_redirected_to '/'
  end

end
