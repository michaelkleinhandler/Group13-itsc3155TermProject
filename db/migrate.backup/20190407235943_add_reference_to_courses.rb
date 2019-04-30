class AddReferenceToCourses < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :courses, :id
    add_reference :semesters, :course
  end
end
