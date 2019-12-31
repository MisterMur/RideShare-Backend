class User < ApplicationRecord
  has_many :user_companies
  has_many :companies, through: :user_companies
  has_many :messages
  has_many :forums, -> { distinct }, through: :messages
  has_many :rides

  has_one_attached :profile_pic

  validates :username,uniqueness: true

  has_secure_password


  include Rails.application.routes.url_helpers
  def image_url
      profile_pic.service_url
  end

  def follow(other_user)

   active_relationships.create(followed_id: other_user.id)

  end

  # Unfollows a user.
  def unfollow(other_user)
   active_relationships.find_by(followed_id: other_user.id).destroy
   # byebug
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
   following.include?(other_user)
  end

  has_many :active_relationships, class_name:  "Friendship",
                                   foreign_key: :follower_id,
                                   dependent:   :destroy

   has_many :passive_relationships, class_name:  "Friendship",
                                   foreign_key: :followed_id,
                                     dependent:   :destroy
   has_many :following, through: :active_relationships, source: :followed
   has_many :followers, through: :passive_relationships, source: :follower


end
