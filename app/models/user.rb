class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_one :university
  has_many :enrollments
  has_many :courses, :through => :enrollments
  # has_and_belongs_to_many :courses
  # belongs_to :university
  before_save :set_init
  before_create :randomize_id


  def set_init
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
    Course.joins(:users).where('enrollments.user_id = ?', "987620").references(:enrollments)
  end

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end



end
