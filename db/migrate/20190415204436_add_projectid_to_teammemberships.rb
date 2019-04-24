class AddProjectidToTeammemberships < ActiveRecord::Migration[5.2]
  def change
    add_reference :team_memberships, :project, foreign_key: true
  end
end
