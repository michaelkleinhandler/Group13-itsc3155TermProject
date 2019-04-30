class AddAddtltoGroupsandProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :courses_id
    add_column :projects, :availableDate, :date
    add_column :projects, :dueDate, :date
    add_column :projects, :pickGroups, :boolean
  end
end
