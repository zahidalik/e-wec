class AddAdminToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :admin, :boolean, default: false
  end
end
