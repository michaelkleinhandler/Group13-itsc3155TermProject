class AddUniNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uniName, :string
  end
end
