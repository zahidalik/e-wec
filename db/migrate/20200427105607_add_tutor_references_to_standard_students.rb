class AddTutorReferencesToStandardStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :standard_students, :tutor, null: false, foreign_key: true
  end
end
