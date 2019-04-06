class DropuniId < ActiveRecord::Migration[5.2]
  def change
    remove_column :universities, :uni_id
  end
end
