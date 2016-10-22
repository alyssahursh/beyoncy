require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  #should get all users
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should get specific user on show' do
    test_user = users(:user_without_extras)
    get :show, id: test_user.id
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

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
