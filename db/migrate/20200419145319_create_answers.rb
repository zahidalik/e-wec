class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :subject
      t.string :topic
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
