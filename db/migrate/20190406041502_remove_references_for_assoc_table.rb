class RemoveReferencesForAssocTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :enrollments, :course_id
    remove_column :enrollments, :user_id
    add_belongs_to :enrollments, :user
    add_belongs_to :enrollments, :course

  end
end
