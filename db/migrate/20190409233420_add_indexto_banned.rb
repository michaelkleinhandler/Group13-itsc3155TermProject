class AddIndextoBanned < ActiveRecord::Migration[5.2]
  def change
    add_index :enrollments, :banned
  end
end
