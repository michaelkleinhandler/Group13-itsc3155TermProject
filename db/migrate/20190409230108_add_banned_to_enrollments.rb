class AddBannedToEnrollments < ActiveRecord::Migration[5.2]
  def change
    add_column :enrollments, :banned, :boolean
  end
end
