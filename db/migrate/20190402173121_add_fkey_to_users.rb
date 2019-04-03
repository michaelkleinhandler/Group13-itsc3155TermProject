class AddFkeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :users, :universities, :uni_id
  end
end
