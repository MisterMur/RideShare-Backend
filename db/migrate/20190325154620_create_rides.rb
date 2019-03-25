class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :duration
      t.integer :distance
      t.integer :price
      t.datetime :started_at
      t.datetime :end_at
      t.string :start_location
      t.string :end_location

      t.timestamps
    end
  end
end
