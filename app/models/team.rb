class Team < ApplicationRecord
  belongs_to :project
  has_many :team_memberships, dependent: :destroy
  has_many :users, through: :team_memberships
  has_many :ratings
  before_create :randomize_id
end


private
def randomize_id
  begin
    self.id = SecureRandom.random_number(1_000_000)
  end while Project.where(id: self.id).exists?
end