class UserSerializer < ActiveModel::Serializer
	attributes :id, :car, :name, :username, :password_digest, :rating, :experience, :location

	has_many :companies
  has_many :rides
  has_many :messages
  has_many :forums
  has_many :followers
end
