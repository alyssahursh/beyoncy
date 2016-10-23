require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  # should load all review'
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should load specific review on show' do
    test_review = reviews(:normal_review)
    get :show, id: test_review.id
    assert_response :success
  end

  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  test "should redirect get destroy review" do
    test_review_destroy = reviews(:normal_review)
    get :destroy, id: test_review_destroy.id
    assert_redirected_to '/'
  end

  test 'review count should decrease by one on destroy' do
    assert_difference('Review.count', -1) do
      test_review_destroy = reviews(:normal_review)
      get :destroy, id: test_review_destroy.id
    end

  end

  test "If a user is not logged in they cannot see their review(s)." do
    # session[:user_id] = nil  # ensure no one is logged in

    # get :show, id: reviews(:review).id
    # # if they are not logged in they cannot see the resource and are redirected to login.  
    # assert_redirected session_path
    # assert_equal "You must be logged in first", flash[:notice]
  end

end
