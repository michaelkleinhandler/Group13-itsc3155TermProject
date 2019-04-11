class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_one :university
  has_many :enrollments
  has_many :courses, :through => :enrollments
  has_many :group_memberships
  has_many :groups, :through => :group_memberships
  has_many :projects
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

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end



end
