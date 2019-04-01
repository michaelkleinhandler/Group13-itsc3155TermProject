class Course < ApplicationRecord
  has_many :students
  validates :title, presence: true
  validates :teacher, presence: true
  validates :semester, presence: true
  validates :year, presence: true, length: 4
  validates :subject, presence: true, length: 4
  validates :courseNum, presence: true, length: 4
  validates :section, presence: true
end
