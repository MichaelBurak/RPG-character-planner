class RemovePlannerIdFromTreasures < ActiveRecord::Migration[5.0]
  def change
    remove_column :treasures, :planner_id, :integer
  end
end
