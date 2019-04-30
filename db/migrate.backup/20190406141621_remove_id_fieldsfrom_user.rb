class RemoveIdFieldsfromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :UserID_id
    remove_column :users, :UserID
  end
end
