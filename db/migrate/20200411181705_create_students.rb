class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :gender
      t.string :father_name
      t.string :mother_name
      t.string :guardian_name

      t.timestamps
    end
  end
end
