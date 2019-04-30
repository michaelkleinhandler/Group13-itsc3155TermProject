class AddBoolrolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Instructor, :boolean
    add_column :users, :Student, :boolean
    add_column :users, :OrgAdmin, :boolean
    add_column :users, :SuperAdmin, :string
  end
end
