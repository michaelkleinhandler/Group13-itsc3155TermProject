class AddIndextoUni < ActiveRecord::Migration[5.2]
  def change
    add_reference :universities, :uni_id
    remove_column :universities, :uniID
  end
end
