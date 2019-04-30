class AddColsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :title, :string
    add_column :courses, :teacher, :int
    add_column :courses, :semester, :string
    add_column :courses, :year, :int
    add_column :courses, :subject, :string
    add_column :courses, :coursenum, :string
    add_column :courses, :section, :string
  end
end
