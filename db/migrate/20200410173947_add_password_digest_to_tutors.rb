class AddPasswordDigestToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :password_digest, :string
  end
end
