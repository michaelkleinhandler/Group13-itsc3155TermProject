class ChangeColNamesinEnrollments < ActiveRecord::Migration[5.2]
  def change
    rename_column :enrollments, :users_id, :user_id
    rename_column :enrollments, :courses_id, :course_id

  end
end
