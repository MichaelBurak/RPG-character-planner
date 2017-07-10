class AddSpendablePointsToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :spendable_points, :integer, default: 0, null: false
  end
end
