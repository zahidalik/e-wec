class AddSubmitDateTimeToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :submit_date_time, :datetime
  end
end
