class AddFullNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fullName, :string
  end
end
