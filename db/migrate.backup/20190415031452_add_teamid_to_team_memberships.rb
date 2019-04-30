class AddTeamidToTeamMemberships < ActiveRecord::Migration[5.2]
  def change
    drop_table :team_memberships
  end
end
