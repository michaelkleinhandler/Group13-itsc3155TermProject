class AddUidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :UserID, :int
  end
end
