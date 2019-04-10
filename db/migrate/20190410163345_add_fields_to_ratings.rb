class AddFieldsToRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :ratings, :course, foreign_key: true
    add_reference :ratings, :user, foreign_key: true
    add_column :ratings, :rating, :integer
    add_column :ratings, :created_by, :integer
    add_reference :ratings, :project, foreign_key: true
    drop_table :collaborations
  end
end
