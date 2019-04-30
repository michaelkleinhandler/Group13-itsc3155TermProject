class AddFkeyToSemesters < ActiveRecord::Migration[5.2]
  def change
    add_reference :semesters, :semester, foreign_key: true
  end
end
