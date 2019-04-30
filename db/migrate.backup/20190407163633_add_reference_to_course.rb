class AddReferenceToCourse < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :semester
    add_reference :courses, :semester
  end
end
