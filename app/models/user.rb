class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :university, foreign_key: :uni_id
  # has_many :courses, foreign_key => :uni_id
  has_many :courseMates
  has_many :instructors
  has_many :gProjects
  has_many :studyGroups
  before_save :set_fields

  def set_fields
    self.UserID = rand (1000000..9999999)
  end

  def uniName
    @user = self
    University.find_by(uni_id: @user.uni_id).uniName
  end



end
