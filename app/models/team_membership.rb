class TeamMembership < ApplicationRecord
  belongs_to :user
  belongs_to :team
  # belongs_to :course
  has_many :ratings
  before_create :check_unique


  def check_unique
    if TeamMembership.where('team_memberships.user_id = ? and team_memberships.team_id = ?', self.user_id, self.team_id).present?
      false
    elsif TeamMembership.where('team_memberships.user_id = ? and team_memberships.project_id = ?', self.user_id, self.project_id).present?
      false
    else
      true
    end
  end



end
