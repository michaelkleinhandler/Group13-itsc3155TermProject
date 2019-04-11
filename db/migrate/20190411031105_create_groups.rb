class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :projects, foreign_key: true
      t.references :courses, foreign_key: true
      t.integer :groupNum
    end
  end
end
