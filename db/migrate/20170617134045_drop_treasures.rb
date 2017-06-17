class DropTreasures < ActiveRecord::Migration[5.0]
  def change
    drop_table :treasures
  end
end
