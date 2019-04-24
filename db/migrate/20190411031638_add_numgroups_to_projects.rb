class AddNumgroupsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :numGroups, :integer
  end
end
