class AddStudentReferencesToStandardSubjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :standard_subjects, :student, null: false, foreign_key: true
  end
end
