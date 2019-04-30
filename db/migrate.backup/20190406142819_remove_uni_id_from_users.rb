class RemoveUniIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :university, foreign_key: true
    remove_column :users, :uni_id

  end
end
