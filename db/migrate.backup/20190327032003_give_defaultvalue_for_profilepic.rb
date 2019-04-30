class GiveDefaultvalueForProfilepic < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :image, :string, default: "/images/profileImages/kid yelling.jpg"
  end
end
