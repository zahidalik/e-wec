class AddEndDateToExams < ActiveRecord::Migration[6.0]
  def change
    add_column :exams, :end_date, :datetime
  end
end
