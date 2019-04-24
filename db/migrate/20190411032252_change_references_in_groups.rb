class ChangeReferencesInGroups < ActiveRecord::Migration[5.2]
  def change
    remove_reference :groups, :courses_id
    remove_reference :groups, :projects_id
    add_reference :groups, :course
    add_reference :groups, :project

  end
end
