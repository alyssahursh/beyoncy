require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # woo hoo easy tests!
  test "the truth" do
    assert true
  end

  ####### validations ######
  test 'addresses must have kind' do
    assert_not(addresses(:address_without_kind).valid?)
  end

  test 'if a kind is added to an address it must become valid' do

  end

  test 'new addresses created without kinds are not valid' do

  end
#########
  test 'addresses must have last_name' do

  end

  test 'if a last_name is added to an address it must become valid' do

  end

  test 'new addresses created without last_names are not valid' do

  end
#########
  test 'addresses must have street1' do

  end

  test 'if a street1 is added to an address it must become valid' do

  end

  test 'new addresses created without street1 are not valid' do

  end

  ########

  test 'addresses must have city' do

  end

  test 'if a city is added to an address it must become valid' do

  end

  test 'new addresses created without city are not valid' do

  end
  ########

  test 'addresses must have state' do

  end

  test 'if a state is added to an address it must become valid' do

  end

  test 'new addresses created without state are not valid' do

  end
  ########

  test 'addresses must have country' do

  end

  test 'if a country is added to an address it must become valid' do

  end

  test 'new addresses created without country are not valid' do

  end
  ########

  test 'addresses without non-essential info are valid' do
    assert(addresses(:address_without_extras).valid?)
  end


end
