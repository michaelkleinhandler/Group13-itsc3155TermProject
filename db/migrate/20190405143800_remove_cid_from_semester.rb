class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :courseID_id
    add_reference :courses, :course, foreign_key: true
  end
end
