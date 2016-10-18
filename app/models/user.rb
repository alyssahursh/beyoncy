class User < ActiveRecord::Base
  has_many :orders
  has_many :reviews
  has_many :addresses
end
