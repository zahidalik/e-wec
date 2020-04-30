class CreateStandardTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :standard_tutors do |t|
      t.references :standard, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
