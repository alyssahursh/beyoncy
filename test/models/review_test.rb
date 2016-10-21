require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

######## testing validations ####################
  test 'reviews must have subjects' do
    assert(reviews(:normal_review).valid?)
    assert_not(reviews(:review_without_subject).valid?)
  end

  test 'reviews without a subject should become valid when a subject is added' do
    review = reviews(:review_without_subject)
    assert_not(review.valid?)

    review.subject = "cats are cool"
    assert(review.valid?)

  end

  test 'review should be come invalid when subject is removed' do
    review = reviews(:normal_review)
    assert(review.valid?)

    review.subject = nil
    assert_not(review.valid?)
  end

  test 'new review should be invalid if it does not have a subject' do
    review = Review.new(body: "hi", rating: 4, user_id: 1200, product_id: 102440)
    assert_not(review.valid?)
  end

  test 'reviews can have no rating and still be valid' do
    assert(reviews(:review_without_rating).valid?)

    review = reviews(:normal_review)
    review.rating = nil

    assert(review.valid?)
  end

  test 'reviews can be created with no rating and still be valid' do
    review = Review.new(subject: "100 emoji", body: "cool cool cool cool cool", user_id: 100, product_id: 140)
    assert(review.valid?)
  end

  test 'reviews should not be valid if the rating is not within 1..5' do
    review = reviews(:normal_review)
    assert(review.valid?)

    assert_not(reviews(:_100_review).valid?)

    review.rating = 100
    assert_not(review.valid?)

    review.rating = 0
    assert_not(review.valid?)

    review.rating = -109545
    assert_not(review.valid?)

    review.rating = 6
    assert_not(review.valid?)
  end

  test 'reviews with ratings that are not integers are not valid' do
    review = reviews(:normal_review)
    assert(review.valid?)

    review.rating = 1.545
    review.save
    assert_not(review.valid?)

      # review.rating = [1,5,4,2,3]
      # assert_not(review.valid?)
      #
      # review.rating = "this is a good movie"
      # assert_not(review.valid?)
  end


######## testing relationships with user ###########

######## testing relationships with product ###########

end
