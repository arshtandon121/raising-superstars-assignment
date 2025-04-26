class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :duration_minutes

      t.timestamps
    end
  end
end
