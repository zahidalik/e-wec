class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.string :topic
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
