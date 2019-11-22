class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :username, :password_digest, :rating, :experience, :location

	has_many :companies
  has_many :rides
  has_many :messages
  has_many :forums
  has_many :friendships
end
