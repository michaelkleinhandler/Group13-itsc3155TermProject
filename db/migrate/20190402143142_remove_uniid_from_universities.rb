class RemoveUniidFromUniversities < ActiveRecord::Migration[5.2]
  def change
    remove_column :universities, :uniID, :string
  end
end
