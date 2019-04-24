class Semester < ApplicationRecord
  # has_one :university, foreign_key: :uni_id
  # belongs_to :university, foreign_key: :uni_id, optional: true
  has_many :courses
  has_many :projects
  before_create :randomize_id


  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Semester.where(id: self.id).exists?
  end


end
