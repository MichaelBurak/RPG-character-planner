class AddPlannerIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :planner_id, :integer
  end
end
