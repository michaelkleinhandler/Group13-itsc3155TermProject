class RemoveUnneededfromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :courses, :randID
    remove_column :courses, :randID
    remove_index :courses, :User_id
    remove_index :courses, :uni_id
  end
end
