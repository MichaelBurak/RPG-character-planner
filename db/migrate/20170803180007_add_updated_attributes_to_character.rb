class AddUpdatedAttributesToCharacter < ActiveRecord::Migration[5.0]
    def change
      add_column :characters, :updated_attributes, :integer, default: 0, null: false
  end
end
