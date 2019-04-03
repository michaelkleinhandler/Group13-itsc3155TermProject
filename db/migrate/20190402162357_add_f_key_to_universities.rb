class AddFKeyToUniversities < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :uni_id_id

  end
end
