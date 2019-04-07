class RemoveYearFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :year, :string
  end
end
