class CreateForums < ActiveRecord::Migration[5.2]
  def change
    create_table :forums do |t|
        t.string :topic
        t.string :tags
      t.timestamps
    end
  end
end
