class CreateTreasures < ActiveRecord::Migration[5.0]
  def change
    create_table :treasures do |t|
      t.string :name
      t.integer :gold_value
      t.string :kind
      t.integer :event_id
    end
  end
end
