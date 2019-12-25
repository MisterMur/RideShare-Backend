class User < ApplicationRecord
  has_many :user_companies
  has_many :companies, through: :user_companies
  has_many :messages
  # has_many :forums, through: :messages
  has_many :forums, -> { distinct }, through: :messages
  has_many :rides

  has_one_attached :profile_pic

  validates :username,uniqueness: true

  has_secure_password

###########
###MIGHT NEED FOLLOWING COMMENtS FOR FOLLOWER?FOLLOWING
##########

# has_many :active_relationships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
# has_many :passive_relationships, class_name: "Friendship", foreign_key: "followee_id", dependent: :destroy
# has_many :followers, :through => :active_relationships, :source => <name>'
# has_many :followers, through: :active_relationships, source: :followee_user
# has_many :followees, through: :passive_relationships, source: :follower_user

####################
include Rails.application.routes.url_helpers
def image_url
    profile_pic.service_url
end
# Rails.application.routes.url_helpers.rails_blob_path(self.profile_pic, only_path: true)

 #
 # def image_url
 #   rails_blob_path(self.cover, disposition: "attachment", only_path: true)
 # end
 # has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
 # has_many :followers, through: :follower_relationships, source: :follower
 #
 # has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
 # has_many :following, through: :following_relationships, source: :following

 def follow(user_id)
   # follower_relationships
     active_relationships.create(following_id: user_id)
   end

 def unfollow(user_id)
   active_relationships.find_by(following_id: user_id).destroy
 end
 #this working already below
 has_many :active_relationships, class_name:  "Friendship",
                                   foreign_key: :follower_id,
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, foreign_key: :followed_id, class_name: "Friendship" , dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

# has_many :followee_follows, foreign_key: :follower_id, class_name: "Friendship"

end
