class DropProjectsIdFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :projects_id
  end
end
