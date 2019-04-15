class Team < ApplicationRecord
  belongs_to :project, optional: true
  has_many :team_memberships, dependent: :destroy
  has_many :users, through: :group_memberships
  before_create :randomize_id
end


private
def randomize_id
  begin
    self.id = SecureRandom.random_number(1_000_000)
  end while Project.where(id: self.id).exists?
end