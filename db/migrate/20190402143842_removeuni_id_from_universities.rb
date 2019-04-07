class RemoveuniIdFromUniversities < ActiveRecord::Migration[5.2]
  def change
    remove_column :universities, :uniID
    remove_column :universities, :uniID_id
  end
end
