class AddCourseidToTeammemberships < ActiveRecord::Migration[5.2]
  def change
    add_reference :team_memberships, :course
  end
end
