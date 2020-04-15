class RemoveAcademicYearFromStandards < ActiveRecord::Migration[6.0]
  def change
    remove_column :standards, :academic_year, :date
  end
end
