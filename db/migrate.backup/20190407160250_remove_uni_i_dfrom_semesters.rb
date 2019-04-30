class RemoveUniIDfromSemesters < ActiveRecord::Migration[5.2]
  def change
    remove_column :semesters, :uni_id
    add_reference :semesters, :university

  end
end
