class GiveDefaultvalueForApproved < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :approved, :boolean, default: 'false'
  end
end
