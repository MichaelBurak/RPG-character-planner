class AddPlannerIdToTreasure < ActiveRecord::Migration[5.0]
  def change
    add_column :treasures, :planner_id, :integer
  end
end
