class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :tutor, null: false, foreign_key: true
      t.references :standard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
