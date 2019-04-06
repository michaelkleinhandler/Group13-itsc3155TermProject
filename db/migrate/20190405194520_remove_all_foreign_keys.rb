class RemoveAllForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_index :courses, :User_id
    remove_index :courses, :course_id
    remove_index :courses, :uni_id
    remove_index :semesters, :semester_id
    remove_index :semesters, :uni_id
    remove_index :students, :courses_id
    remove_index :universities, :uni_id
  end
end
