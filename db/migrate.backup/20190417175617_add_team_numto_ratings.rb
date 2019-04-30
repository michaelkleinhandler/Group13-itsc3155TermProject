class AddTeamNumtoRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :ratings, :team

  end
end
