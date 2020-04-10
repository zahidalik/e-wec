class ChangeContactToBeStringInTutors < ActiveRecord::Migration[6.0]
  def change
    change_column :tutors, :contact, :string
  end
end
