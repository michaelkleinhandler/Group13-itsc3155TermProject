class CorrectNameinUniv < ActiveRecord::Migration[5.2]
  def change
    remove_column :universities, :uni_id_id
    add_reference :universities, :uni
  end
end
