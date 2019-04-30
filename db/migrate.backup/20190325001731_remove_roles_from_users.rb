class RemoveRolesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :isTeacher, :string
    remove_column :users, :isAdmin, :boolean
  end
end
