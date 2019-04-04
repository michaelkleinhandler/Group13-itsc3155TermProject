class Semester < ApplicationRecord
  has_one :university, foreign_key: :uni_id
  before_save :setVars

  def setVars
    # self.endDate = self.endDate.to_date
    # self.beginDate = self.beginDate.to_date
  end
end
