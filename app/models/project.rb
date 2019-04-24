class Project < ApplicationRecord
  belongs_to :course
  belongs_to :user, optional: true
  belongs_to :semester, optional: true
  has_many :teams, dependent: :destroy
  has_many :ratings, dependent: :destroy
  before_save :saveActions
  before_create :createActions
  before_create :randomize_id


  def saveActions
    # self.semester_id = :course.semester_id
    # self.user_id = :user.id

  end

  def createActions

  end


  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Project.where(id: self.id).exists?
  end



end
