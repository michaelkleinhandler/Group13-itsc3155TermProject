class RevertDatesToDatesInSemesters < ActiveRecord::Migration[5.2]
  def change
    change_column :semesters, :beginDate, :date
    change_column :semesters, :endDate, :date
  end
end
