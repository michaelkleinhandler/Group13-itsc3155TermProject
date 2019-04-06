class AddFkeyUniversityToCourse < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :universities, :courses
  end
end
