class CreateDailyPlanActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_plan_activities do |t|
      t.references :daily_plan, foreign_key: true
      t.references :activity, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
