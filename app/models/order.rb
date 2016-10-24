class Order < ActiveRecord::Base
  belongs_to :user
<<<<<<< HEAD
  has_and_belongs_to_many :products
  has_many :order_products

  def subtotal
    @subtotal = 0
    order_products.each do |order_product|
      if order_product.valid?
        @subtotal += order_product.qty * order_product.price_per
      end
    end
  end
=======
  
  #TODO this line breaks the orders controller destroy test.
  #has_and_belongs_to_many :products

  # order must be associated with a user. don't put this in the user validations or else we'll get an infinite loop!
  validates :user_id, presence: true
  validates_associated :user

>>>>>>> 7739adba65483e087e1b3143ff054e6a20f72a31
end
