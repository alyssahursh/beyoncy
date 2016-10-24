class Product < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :orders
  has_many :reviews

  default_scope { where(active: true) }

  # product must have a name
  validates :name, presence: true

  # product must mave a price, that price must be an integer, and the price must be larger than zero
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # product must either be active or inactive
  # validates :active, inclusion: { in: [true, false] }
  # validates :active, exclusion: { in: [nil] }

  # product must be associated with a category. don't put this in the category validations or else we'll get an infinite loop!
  validates :category_id, presence: true
  validates_associated :category

  def archive
    update_attribute(:active, false)
  end

end
