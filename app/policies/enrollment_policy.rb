class EnrollmentPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    if (@user.id == @course.teacher) or ((@user.university_id == @course.uni_id) and @user.OrgAdmin?) or @user.SuperAdmin?
      true
    end
  end




  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
