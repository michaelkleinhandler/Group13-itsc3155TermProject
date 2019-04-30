class ChangeSemtypeInCourses < ActiveRecord::Migration[5.2]
  def change
    change_column :courses, :semester, :integer
  end
end
