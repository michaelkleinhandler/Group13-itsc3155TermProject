class RatingPolicy < ApplicationPolicy

  def initialize(user,rating)
    @user = user
    @rating = rating
  end

  def new?
    if @user.id != @rating.team_membership.user_id and (@user.enrollments.where('enrollments.user_id = ? and enrollments.course_id = ?', @user.id, @rating.team_membership.course_id).present?)
      if @rating.ratingDates
        true
      end
    end
  end

  def create?
    true
  end

  def destroy?
    if @rating.project.course.teacher == @user.id or isAdmin?
      true
    end
  end




  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
