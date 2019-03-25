class AddRolefieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :defRole, :string
  end
end
