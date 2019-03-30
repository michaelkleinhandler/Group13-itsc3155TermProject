class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses
  has_many :courseMates
  has_many :instructors
  has_many :gProjects
  has_many :studyGroups
  before_save :set_uid

  def set_uid
    self.UserID = rand (1000000..9999999)
  end

end
