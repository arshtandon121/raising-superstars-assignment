class CreateDailyPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_plans do |t|
      t.references :program, foreign_key: true
      t.integer :day_number

      t.timestamps
    end
  end
end
