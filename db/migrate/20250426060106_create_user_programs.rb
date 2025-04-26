class CreateUserPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :user_programs do |t|
      t.references :user, foreign_key: true
      t.references :program, foreign_key: true
      t.date :start_date

      t.timestamps
    end
  end
end
