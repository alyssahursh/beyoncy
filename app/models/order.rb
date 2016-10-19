class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products

  # order must be associated with a user. don't put this in the user validations or else we'll get an infinite loop!
  validates :user_id, presence: true
  validates_associated :user

end
