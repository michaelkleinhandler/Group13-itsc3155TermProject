class CreateRatingsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings_tables do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :rating
    end

    rename_table :groups, :teams
  end
end
