require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

######## test user validations ##############
test 'users must have email' do
  assert(users(:normal_user).valid?)
  assert_not(users(:user_without_email).valid?)
end

test 'if an email is added to a user w/o email, it should become valid' do
  user = users(:user_without_email)
  assert_not(user.valid?)

  user.email = "cat@caterpillar.com"
  assert(user.valid?)
end

test 'new users created without emails are not valid' do
  user = User.new(first_name: "lauren", last_name: "cat", birthdate: "2011-01-03", phone: 23954343, admin: false, active: true, uid: 23953540, provider: 'github')
  assert_not(user.valid?)
end

test 'user emails should be unique' do
  user = users(:user_without_email)
  user.email = "edith@edith.com" # the email address of :normal_user
  assert_not(user.valid?)
end
########### test user relationships with orders, reviews, addresses #############

test 'users without non essential info are still valid' do
  assert(users(:user_without_extras).valid?)
end

test 'users can have orders' do
  assert_not_empty(users(:normal_user).orders)

  user = users(:user_without_extras)
  order = Order.new(user_id: users(:user_without_extras).id, shipping_cost: 12004, order_status: "all right, not great")

  order.save
  assert_not_empty(user.orders)
end

test 'users can have reviews' do
  assert_not_empty(users(:normal_user).reviews)

  user = users(:user_without_extras)
  review = Review.new(user_id: users(:user_without_extras).id, subject: "sup this is a review", rating: 5, product_id: 12)

  review.save
  assert_not_empty(user.reviews)
end

test 'users can have addresses' do
  assert_not_empty(users(:normal_user).addresses)

  user = users(:user_without_extras)
  address = Address.new(user_id: users(:user_without_extras).id, kind: "home", last_name: "big papi", street1: "943 northern way", city: "Moscow", state: "state", country: "canada")

  address.save
  assert_not_empty(user.addresses)
end

########## test build_from_github method ##############
end
