class Course < ApplicationRecord
  # has_many :users
  delegate :teacher, :to=>:user
  # validates :title, presence: true
  # validates :teacher, presence: true
  # validates :semester, presence: true
  # validates :year, presence: true, length: {minimum: 4}
  # validates :subject, presence: true, length: {minimum: 4}
  # validates :coursenum, presence: true, length: {minimum: 4}
  # validates :section, presence: true
  # before_create :gen_course_ID
  # before_save :normalizeSemester
  # has_one :semester, foreign_key: :randID
  # belongs_to :university, foreign_key: :uni_id, optional: true
  # has_and_belongs_to_many :users
  def gen_course_ID
    self.course_id = rand (1000000..9999999)
  end

  def normalizeSemester
    self.semester = self.semester.to_int
  end

end
