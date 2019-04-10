class DefaultBannedtoFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :enrollments, :banned, :boolean, :default => false
  end
end
