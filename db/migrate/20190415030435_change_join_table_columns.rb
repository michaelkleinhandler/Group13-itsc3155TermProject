class ChangeJoinTableColumns < ActiveRecord::Migration[5.2]
  def change
    rename_table :group_memberships, :team_memberships
    change_column :team_memberships, :group_id, :team_id


  end
end
