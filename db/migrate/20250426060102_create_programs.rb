class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.integer :duration_days

      t.timestamps
    end
  end
end
