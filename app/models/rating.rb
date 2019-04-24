class Rating < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team_membership, optional: true
  belongs_to :project, optional: true
  belongs_to :team
  before_create :check_unique


  def check_unique
    if Rating.where('ratings.user_id = ? and ratings.project_id = ? and ratings.created_by = ?', self.user_id, self.project_id, self.created_by).present?
      false
    else
      true
    end
  end

  def check_exists(user)
    if Rating.where('ratings.user_id = ? and ratings.project_id = ? and ratings.created_by = ?', self.user_id, self.project_id, user.id).present?
      true
    end
  end

  def ratingDates
    @project = Project.find(self.team_membership.project_id)
    if Date.today >= @project.dueDate+1 and Date.today <= @project.dueDate+8
      true
    end
  end

  def getCreator
    User.find(self.created_by).fullName
  end


end
