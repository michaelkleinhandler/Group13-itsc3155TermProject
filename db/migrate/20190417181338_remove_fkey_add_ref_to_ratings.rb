class RemoveFkeyAddRefToRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :ratings, :team_membership
  end
end
