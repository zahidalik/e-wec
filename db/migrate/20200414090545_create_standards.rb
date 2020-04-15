class CreateStandards < ActiveRecord::Migration[6.0]
  def change
    create_table :standards do |t|
      t.string :name
      t.date :academic_year

      t.timestamps
    end
  end
end
