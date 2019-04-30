class RemoveSemesteridFromSemesters < ActiveRecord::Migration[5.2]
  def change
    remove_column :semesters, :semester_id, :string
  end
end
