class CreateStandardStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :standard_students do |t|
      t.references :standard, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
