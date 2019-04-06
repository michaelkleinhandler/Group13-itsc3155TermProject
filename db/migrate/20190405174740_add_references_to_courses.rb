class AddReferencesToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :uni, foreign_key: true
  end
end
