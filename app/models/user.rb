class User < ApplicationRecord
  has_many :user_companies
  has_many :companies, through: :user_companies
  has_many :messages
  has_many :forums, through: :messages
  has_many :rides
  
has_many :follower_follows, foreign_key: :followee_id, class_name: "Friendship"
  has_many :followers, through: :follower_follows, source: :follower

has_many :followee_follows, foreign_key: :follower_id, class_name: "Friendship"
  has_many :followees, through: :followee_follows, source: :folowee

end
