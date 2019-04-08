class Course < ApplicationRecord
  # has_many :users
  validates :semester, presence: true
  validates :subject, presence: true, length: {minimum: 4}
  validates :coursenum, presence: true, length: {minimum: 4}
  validates :section, presence: true
  before_create :randomize_id
  before_save :setTitle
  # before_save :normalizeSemester
  # has_one :semester, foreign_key: :randID
  # belongs_to :university, foreign_key: :uni_id, optional: true
  has_many :enrollments
  has_many :users,through: :enrollments, dependent: :destroy
  belongs_to :semester
  # belongs_to :semester
  # has_one :user
  # belongs_to :user, optional: true


  def setTitle
    self.title = "#{Semester.find(self.semester_id).name} #{self.subject} #{self.coursenum} #{self.section}"
  end

  def getTeacher
    User.find_by_id(self.teacher).fullName
  end




  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Course.where(id: self.id).exists?
  end



end
