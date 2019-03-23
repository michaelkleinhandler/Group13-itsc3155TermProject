class AddUniToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :university, :string
  end
end
