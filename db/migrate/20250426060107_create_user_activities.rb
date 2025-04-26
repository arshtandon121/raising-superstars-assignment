class CreateUserActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :user_activities do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true
      t.references :daily_plan, foreign_key: true
      t.boolean :completed
      t.datetime :completed_at

      t.timestamps
    end
  end
end
