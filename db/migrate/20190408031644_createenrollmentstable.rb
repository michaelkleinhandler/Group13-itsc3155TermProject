class Createenrollmentstable < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments, id: false do |t|
      t.belongs_to :user
      t.belongs_to :course
    end
  end
end
