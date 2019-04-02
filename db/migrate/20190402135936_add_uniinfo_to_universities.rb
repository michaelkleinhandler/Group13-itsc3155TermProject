class AddUniinfoToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_column :universities, :uniName, :string
    add_column :universities, :uniID, :int
  end
end
