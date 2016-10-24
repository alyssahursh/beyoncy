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

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
    
  test "should create a new address on post request" do
    assert_difference('Address.count', 1) do
      post :create,   
      { address: 
        {kind: 'home', 
          first_name: 'James', 
          last_name: 'Howlet', 
          street1: '1215 Harry Hines Blvd', 
          city: 'Port Manteau', 
          state: 'WA',
          zip: '66666',
          country: 'USA',
          phone: '2146826000',
          user_id: 12
          } 
        }


    end
  end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  test "should update address on patch request" do
    # get it from yml
    test_address_update = addresses(:normal_address)
    # make a change hash
    test_address_change = {first_name: 'Dez'}
    # send patch request
    patch :update, id: test_address_update.id, address: test_address_change
    # read  the changed address from the database
    updated_address = Address.find(test_address_update.id)
    # verify the data change
    assert_equal 'Dez', updated_address.first_name
  end

  test "should redirect on addresses destroy" do
    test_address_destroy = addresses(:normal_address)

    get :destroy, id: test_address_destroy.id
    assert_redirected_to '/'
  end

  test 'address count should decrease by one on destroy' do
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
