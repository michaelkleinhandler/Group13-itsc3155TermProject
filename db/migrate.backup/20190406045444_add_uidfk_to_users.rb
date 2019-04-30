class AddUidfkToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :UserID
  end
end
