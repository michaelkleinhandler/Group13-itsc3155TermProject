class Semester < ApplicationRecord
  # has_one :university, foreign_key: :uni_id
  # belongs_to :university, foreign_key: :uni_id, optional: true
  belongs_to :course, optional: true
  before_create :set_semID


  def set_semID
    self.semester_id = rand(1000000..9999999)
  end

end
