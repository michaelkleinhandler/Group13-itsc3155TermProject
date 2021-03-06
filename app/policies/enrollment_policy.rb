class EnrollmentPolicy < ApplicationPolicy

  def initialize(user,enrollment)
    @user = user
    @enrollment = enrollment
  end

  def new?
    # if @user.id == @enrollment.user_id
      true
    # end
  end

  def create?
      if @user.id == @enrollment.user_id and Date.today.between?(@enrollment.course.semester.beginDate, @enrollment.course.semester.endDate) or isAdmin?
        true
      end
  end

  def adminNew?
    isAdmin?
  end

  def destroy?
    if (@user.id == @enrollment.teacher) or ((@user.university_id == @course.uni_id) and @user.OrgAdmin?) or @user.SuperAdmin?
      true
    end
  end




  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
