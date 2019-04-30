class AddForeignToUsers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :users, :universities
    add_foreign_key :universities, :users

  end
end
