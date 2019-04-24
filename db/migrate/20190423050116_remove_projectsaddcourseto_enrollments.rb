class RemoveProjectsaddcoursetoEnrollments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :enrollments, :project_id
    add_reference :enrollments, :course
  end
end
