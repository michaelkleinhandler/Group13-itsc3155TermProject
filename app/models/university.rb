class University < ApplicationRecord
  before_create :randomize_id
  # has_many :users
  has_many :semesters, foreign_key: :uni_id
  belongs_to :user, optional: true



  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while University.where(id: self.id).exists?
  end

end
