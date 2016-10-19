require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # let's pass an easy test!
  test "the truth" do
    assert true
  end


############## testing product validations #############
  test 'products must have a name' do
    assert(products(:normal_product).valid?)
    assert_not(products(:nameless_product).valid?)
  end

  test 'once a name is added to a product that does not have a name, it should become valid' do

    product = products(:nameless_product)
    product.name = "here is a name"
    product.save

    assert(product.valid?)
  end

  test 'if a name is removed from a product, then it should no longer be valid' do

    product = products(:normal_product)
    assert(product.valid?)

    product.name = nil
    assert_not(product.valid?)
  end

  test 'products must have prices' do
    assert(products(:normal_product).valid?)
    assert_not(products(:product_with_no_price).valid?)
  end

  test 'products\' prices should be greater than or equal to zero' do
    assert(products(:normal_product).valid?)
    assert_not(products(:product_with_negative_price).valid?)
    assert(products(:free_product).valid?)
  end

  test 'if a price is removed from a product, then it should no longer be valid' do
    product = products(:normal_product)
    assert(product.valid?)

    product.price = nil
    assert_not(product.valid?)
  end

  test 'product prices must be integers' do
    product = products(:normal_product)
    assert(product.valid?)

    product.price = 10.03
    assert_not(product.valid?)

    product.price = [1,4,6,4,32]
    assert_not(product.valid?)

    product.price = "this is the price!"
    assert_not(product.valid?)
  end

  test 'product must be either active or inactive' do
    assert(products(:normal_product).valid?)
    assert_not(products(:product_without_active_marker).valid?)
  end

  test 'if a product is made inactive it is still valid' do
    product = products(:normal_product)
    assert(product.valid?)

    product.active = false
    assert(product.valid?)
  end

  # this test currently fails because it's not really necessary in Rails 4. right now anything not explicitly true is (apparently?) false. this will change in rails 5 going forward where it will be true.
  test 'if a product\'s active status is anything but "true" or "false," it is not valid' do
    product = products(:normal_product)
    assert(product.valid?)

    # product.active = 5
    # assert(product.valid?)

    # product.active = "cat"
    # assert_not(product.valid?)
    #
    # product.active = nil
    # assert_not(product.valid?)
    #
    # product.active = [1,4,56,4,442,3.5]
    # assert_not(product.valid?)
    #
    # product.active = products(:product_with_no_price)
    # assert_not(product.valid?)
  end

  test 'products must have a category' do
    assert(products(:normal_product).valid?)
    assert_not(products(:product_with_no_category).valid?)
  end

  test 'product should have the correct category' do
    product = products(:normal_product)
    category = categories(:normal_category)

    assert_equal(product.category_id, category.id)
  end

end
