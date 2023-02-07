class CompanySerializer < ActiveModel::Serializer
	attributes :id, :name, :name
	has_many :users
	has_many :rides


end
