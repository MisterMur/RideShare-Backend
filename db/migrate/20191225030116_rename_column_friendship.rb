class RenameColumnFriendship < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendships, :followee, :followeed
  end
end
