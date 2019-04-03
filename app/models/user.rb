class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_one :university, foreign_key: :uni_id
  # has_many :courses, foreign_key => :uni_id
  has_many :courseMates
  has_many :instructors
  has_many :gProjects
  has_many :studyGroups
  before_save :set_init
  before_create :setPermFields

  def set_init
    if self.lastName.upcase == 'ADMIN'
      self.SuperAdmin = true
      self.approved = true;
    end
  end

  def setPermFields
    self.UserID = rand (1000000..9999999)
  end

  def uniName
    @user = self
    University.find_by(uni_id: @user.uni_id).uniName
  end



end
