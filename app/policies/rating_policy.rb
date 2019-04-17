class RatingPolicy < ApplicationPolicy

  def initialize(user,rating)
    @user = user
    @rating = rating
  end

  def new?
    if @user.id != @rating.team_membership.user_id
      true
    end
  end

  def create?
    true
  end




  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
