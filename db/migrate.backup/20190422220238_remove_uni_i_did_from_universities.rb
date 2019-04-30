class RemoveUniIDidFromUniversities < ActiveRecord::Migration[5.2]
  def change
    remove_reference :universities, :uniID_id
  end
end
