class EnrollmentPolicy < ApplicationPolicy

  def initialize(user,course)
    @user = user
    @project = course
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    if (@user.id == @project.teacher) or ((@user.university_id == @project.uni_id) and @user.OrgAdmin?) or @user.SuperAdmin?
      true
    end
  end




  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
