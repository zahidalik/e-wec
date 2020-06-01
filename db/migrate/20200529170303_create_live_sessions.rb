class CreateLiveSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :live_sessions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
