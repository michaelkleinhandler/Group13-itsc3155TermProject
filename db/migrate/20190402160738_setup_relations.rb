class SetupRelations < ActiveRecord::Migration[5.2]
  def change
    remove_column :users,:uni_id
    remove_column :universities, :uni_id
    add_reference :users, :universities, index:true, foreign_key:true
  end
end
