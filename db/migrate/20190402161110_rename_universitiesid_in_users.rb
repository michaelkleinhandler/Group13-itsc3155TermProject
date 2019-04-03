class RenameUniversitiesidInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :universities_id, :uni_id
  end
end
