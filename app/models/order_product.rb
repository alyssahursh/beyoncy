class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validate :product_present
  validate :order_present

  
end
