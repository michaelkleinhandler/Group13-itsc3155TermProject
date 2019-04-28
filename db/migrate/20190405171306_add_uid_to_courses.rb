class AddUidToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :User
  end
end
