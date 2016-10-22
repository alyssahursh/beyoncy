require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index

    # examples for future reference
    # get :show, params: { id: 12 }
    # patch update_url, params: { id: 12 }

    assert_response :success
  end

  test 'that the controller populates categories and products on get' do
    get :index
    assert(@controller.categories.length > 0)
    assert(@controller.products.length > 0)
  end

end
