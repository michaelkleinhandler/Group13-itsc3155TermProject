class RemoveEnrollmentsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :enrollments
  end
end
