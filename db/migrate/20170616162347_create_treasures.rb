class CreateTreasures < ActiveRecord::Migration[5.0]
  def change
    create_table :treasures do |t|
      t.string :name
      t.integer :gold_value
      t.string :type
      t.integer :event_id

      t.timestamps
    end
  end
end
