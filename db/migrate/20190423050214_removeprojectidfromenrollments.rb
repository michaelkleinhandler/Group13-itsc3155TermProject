class Removeprojectidfromenrollments < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :enrollments, :project_id
    remove_column :enrollments, :project_id
  end
end
