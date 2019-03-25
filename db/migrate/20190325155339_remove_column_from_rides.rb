class RemoveColumnFromRides < ActiveRecord::Migration[5.2]
  def change
    remove_column :rides, :duration
  end
end
