class RemoveKeysfromTables < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :projects, :project_id
    remove_column :projects, :project_id
    remove_foreign_key :universities, :uniID_id
    remove_column :universities, :uniID_id
    remove_foreign_key :universities, :uniID_id_id
    remove_column :universities, :uniID_id_id
    
  end
end
