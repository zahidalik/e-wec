class AddStudentReferencesToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_reference :interactions, :student, null: false, foreign_key: true
  end
end
