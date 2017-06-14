class CreatePlanners < ActiveRecord::Migration[5.0]
  def change
    create_table :planners do |t|
      t.integer :character_id
      t.integer :user_id

      t.timestamps
    end
  end
end
