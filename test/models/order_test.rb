require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

########### test relationship with user #########


  test 'orders must belong to a user' do
    assert(orders(:normal_order).valid?)
    assert_not(orders(:order_without_user).valid?)
  end

  test 'orders should have the correct user' do
    order = orders(:normal_order)
    user = users(:normal_user)

    assert_equal(order.user_id, user.id)
  end
end
