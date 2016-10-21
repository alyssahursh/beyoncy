class User < ActiveRecord::Base
  validates :email, :uid, :provider, presence: true
  validates_uniqueness_of :email

  has_many :orders
  has_many :reviews
  has_many :addresses

  def self.build_from_github(auth_hash)
    user       = User.new
    user.uid   = auth_hash[:uid]
    user.provider = 'github'
    user.name  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']

    return user
  end
end
