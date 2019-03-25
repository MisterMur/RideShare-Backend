class User < ApplicationRecord
  has_many :user_companies
  has_many :companies, through: :user_companies
  has_many :messages
  has_many :forums, through: :messages
  has_many :rides
end
