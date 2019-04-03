class Course < ApplicationRecord
  has_many :students
  validates :title, presence: true
  validates :teacher, presence: true
  validates :semester, presence: true
  validates :year, presence: true, length: {minimum: 4}
  validates :subject, presence: true, length: {minimum: 4}
  validates :coursenum, presence: true, length: {minimum: 4}
  validates :section, presence: true
  before_save :gen_course_ID


  def gen_course_ID
    self.randID = rand (1000000..9999999)
  end

end
