class RemoveFKeyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :uni_id
  end
end
