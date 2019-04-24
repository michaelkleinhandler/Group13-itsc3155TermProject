class TeamMembershipPolicy < ApplicationPolicy

  def initialize(user, teamMembership)
    @user = user
    @teamMembership = teamMembership
  end

  def joinGroup?
    if @user.enrolled(@teamMembership.team.project.course_id) and not @user.isTeacher(@teamMembership.team.project.course_id)
      true
    end
  end



  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
