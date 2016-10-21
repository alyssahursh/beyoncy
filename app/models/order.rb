class Order < ActiveRecord::Base
  belongs_to :user
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
end
