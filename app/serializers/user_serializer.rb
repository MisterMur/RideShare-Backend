class UserSerializer < ActiveModel::Serializer
	#tring this below
	# include Rails.application.routes.url_helpers

	attributes :id, :car, :name, :username, :password_digest, :rating, :experience, :location,:profile_pic,:image_url

	has_many :companies
  has_many :rides
  has_many :messages
  has_many :forums
  has_many :followers

#trying this below

	# def profile_pic
	# 	return unless object.profile_pic.attached?
	# 	# debugger
	# 	object.profile_pic.blob.attributes
	# 			.slice('filename', 'byte_size')
	# 			.merge(url: image_url)
	# 			.tap { |attrs| attrs['name'] = attrs.delete('filename') }
	# end
	#
	# def image_url
	# 	url_for(object.profile_pic)
	# end
end
