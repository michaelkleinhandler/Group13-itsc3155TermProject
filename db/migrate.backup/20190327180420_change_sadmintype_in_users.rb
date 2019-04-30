class ChangeSadmintypeInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :SuperAdmin, :boolean
  end
end
