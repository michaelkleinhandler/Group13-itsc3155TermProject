class RemoveDupfromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :uni_id_id
  end
end
