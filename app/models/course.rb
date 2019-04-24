class Course < ApplicationRecord
  # has_many :users
  validates :semester, presence: true
  validates :subject, presence: true, length: {minimum: 4}
  validates :coursenum, presence: true, length: {minimum: 4}
  validates :section, presence: true
  before_create :randomize_id
  before_save :setTitle
  has_many :enrollments
  has_many :users,through: :enrollments, dependent: :destroy
  belongs_to :semester
  has_many :projects
  # belongs_to :semester
  # has_one :user
  # belongs_to :user, optional: true

  # Sets the title of the course
  def setTitle
    self.title = "#{Semester.find(self.semester_id).name} #{self.subject} #{self.coursenum} #{self.section}"
  end

  # Retrieves the teacher by their id
  def getTeacher
    if User.find_by_id(self.teacher).presence
      User.find_by_id(self.teacher).fullName
    else
      "Invalid teacher"
    end
  end

  # Retrieves the list of students from a specific course
  def getStudents
    User.joins(:courses).where('enrollments.course_id = ?', self.id).references(:enrollments)
  end

  # Retrieves the list of student from a specific course who are banned
  def retrieveBanned(student)
    self.enrollments.where('enrollments.course_id = ? and enrollments.user_id = ? ', self.id, student.id).first.banned?
  end





  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Course.where(id: self.id).exists?
  end



end
