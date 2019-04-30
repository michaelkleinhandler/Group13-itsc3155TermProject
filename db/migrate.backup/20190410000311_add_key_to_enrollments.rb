class AddKeyToEnrollments < ActiveRecord::Migration[5.2]
  def change
    add_column :enrollments, :id, :integer, primary_key: true
  end
end
