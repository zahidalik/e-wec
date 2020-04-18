class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :subject
      t.string :topic
      t.text :description
      t.references :standard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
