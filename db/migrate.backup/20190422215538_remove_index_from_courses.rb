class RemoveIndexFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :project_id
    add_reference :projects, :course
    remove_reference :universities, :uni_id
  end
end
