class AddUniidToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_reference :universities, :uniID, foreign_key: true
  end
end
