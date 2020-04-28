class CreateStandardSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :standard_subjects do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :standard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
