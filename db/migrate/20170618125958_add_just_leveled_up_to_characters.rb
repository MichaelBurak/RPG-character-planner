class AddJustLeveledUpToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :just_leveled_up, :boolean
  end
end
