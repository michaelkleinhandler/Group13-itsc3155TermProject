class Course < ApplicationRecord
  # has_many :users
  delegate :teacher, :to=>:user
  # validates :title, presence: true
  # validates :teacher, presence: true
  # validates :semester, presence: true
  # validates :year, presence: true, length: {minimum: 4}
  # validates :subject, presence: true, length: {minimum: 4}
  # validates :coursenum, presence: true, length: {minimum: 4}
  # validates :section, presence: true
  before_create :randomize_id
  # before_save :normalizeSemester
  # has_one :semester, foreign_key: :randID
  # belongs_to :university, foreign_key: :uni_id, optional: true
  # has_and_belongs_to_many :users
  has_one :semester, foreign_key: :semester_id


  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Course.where(id: self.id).exists?
  end



end
