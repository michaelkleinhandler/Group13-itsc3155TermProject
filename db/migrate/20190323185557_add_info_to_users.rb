class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :isTeacher, :boolean
    add_column :users, :isAdmin, :boolean
    add_column :users, :bio, :text
    add_column :users, :image, :text

  end
end
