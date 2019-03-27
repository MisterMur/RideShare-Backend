class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :follower_id, foreign_key: true
      t.integer :followee_id, foreign_key: true
      t.timestamps
    end
  end
end
