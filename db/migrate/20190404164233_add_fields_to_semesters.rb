class AddFieldsToSemesters < ActiveRecord::Migration[5.2]
  def change
    add_column :semesters, :beginDate, :datetime
    add_column :semesters, :endDate, :datetime
    add_column :semesters, :name, :string
    add_reference :semesters, :uni, foreign_key: true
  end
end
