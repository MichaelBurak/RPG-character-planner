class DropJustLeveledUpFromCharacters < ActiveRecord::Migration[5.0]
  def change
    remove_column :characters, :just_leveled_up, :boolean
  end
end
