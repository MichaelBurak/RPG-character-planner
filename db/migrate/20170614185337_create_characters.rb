class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :subtle
      t.integer :powerful
      t.integer :resistant
      t.integer :level
      t.integer :xp

      t.timestamps
    end
  end
end
