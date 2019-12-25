class AddIndexToFriendship < ActiveRecord::Migration[5.2]
  def change
    add_index :friendships, [:follower_id, :followee_id], unique: true

  end
end
