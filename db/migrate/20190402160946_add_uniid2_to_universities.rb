class AddUniid2ToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_column :universities, :uniID, :integer
  end
end
