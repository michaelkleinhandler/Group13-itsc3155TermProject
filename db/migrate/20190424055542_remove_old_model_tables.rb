class RemoveOldModelTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :teachers
    drop_table :students
    drop_table :ratings_tables
  end
end
