class ChangeDatetoStringinSemesters < ActiveRecord::Migration[5.2]
  def change
    change_column :semesters, :beginDate, :string
    change_column :semesters, :endDate, :string
  end
end
