class RenameColumnFriendship < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendships, :followee_id, :followed_id
    add_index :friendships, :followed_id
    # add_index :friendships, [:follower_id, :followed_id], unique: true

  end
end
