class AddTableCoursesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_users
    add_belongs_to :courses_users, :course
    add_belongs_to :courses_users, :user
  end
end
