class AddIsTeacherToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isTeacher, :string
  end
end
