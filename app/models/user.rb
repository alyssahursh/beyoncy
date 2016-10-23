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

    name = split_name(auth_hash['info']['name'])
    user.first_name = name.first
    user.last_name  = name.last

    user.email = auth_hash['info']['email']

    return user
  end

  private
  def split_name(name)
    array = name.split(' ')
    last_name = array.pop
    first_name = array.join(' ')
    return first_name, last_name
  end
end
