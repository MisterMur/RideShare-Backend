class UserSerializer < ActiveModel::Serializer
	#tring this below
	# include Rails.application.routes.url_helpers

	attributes :id, :car, :name,
	 :username, :password_digest,
	  :rating, :experience,
		 :location,:profile_pic,:image_url

	has_many :companies
  has_many :rides
  has_many :messages
  has_many :forums
  has_many :followers
	has_many :following



end
