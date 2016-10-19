class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  # must have a subject
  validates :subject, presence: true

  # review must be associated with a user & a product. don't put these in the user & product validations or else we'll get an infinite loop!
  validates :user_id, presence: true
  validates_associated :user

  validates :product_id, presence: true
  validates_associated :product
end
