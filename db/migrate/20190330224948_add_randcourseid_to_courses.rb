class AddRandcourseidToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :randID, :int
  end
end
