class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  # has_one :university
  has_many :enrollments
  has_many :courses, :through => :enrollments
  has_many :team_memberships
  has_many :teams, :through => :team_memberships
  has_many :projects
  has_many :ratings
  # belongs_to :university
  before_save :setCalcFields
  before_create :randomize_id


  def setCalcFields
    self.fullName = "#{self.firstName} #{self.lastName}"

    if self.lastName.upcase == 'ADMIN'
      self.SuperAdmin = true
      self.approved = true;
    end
  end

  def uniName
    @user = self
    if University.find_by(id: @user.university_id)
      University.find_by(id: @user.university_id).uniName
    else
      "Invalid University"
    end
  end

  def getClasses
    Course.joins(:users).where('enrollments.user_id = ? and enrollments.banned = ?', self.id, false).references(:enrollments)
  end

  def getRatings
    oldRatings = Rating.where('ratings.user_id = ? and ratings.created_at < ?', self.id, Date.today - 365)
    currentRatings = Rating.where('ratings.user_id = ? and ratings.created_at >= ?', self.id, Date.today - 365)
    if oldRatings.count > 0 and currentRatings.count > 0
      currentRatings.average(:rating)*0.75 + oldRatings.average(:rating)* 0.25
    elsif oldRatings.count == 0
      currentRatings.average(:rating)
    elsif currentRatings.count == 0
      oldRatings.average(:rating)
    end

  end

  def numRatings
    Rating.where('ratings.user_id = ?', self.id).count
  end

  def hasRated(user, creator, project)
    Rating.where('ratings.user_id = ? and ratings.created_by = ? and ratings.project_id = ? ', user, creator, project).count
  end

  def hasTeam?(project)
    User.joins(:team_memberships).where('team_memberships.user_id = ? and team_memberships.project_id = ?', self.id, project.id).present?
  end

  def myTeams(project)
    Team.joins(:team_memberships).where('teams.project_id = ? and team_memberships.user_id = ?', project.id, self.id )
  end

  def enrolled(courseID)
    User.joins(:enrollments).where('enrollments.user_id = ? and enrollments.course_id = ?', self.id, courseID).present?
  end

  def isTeacher(courseID)
    Course.find(courseID).teacher == self.id
  end

  def getUniName
    University.find(self.university_id).uniName
  end

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end


end
