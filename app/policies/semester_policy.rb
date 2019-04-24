class SemesterPolicy < ApplicationPolicy

  def initialize(user,semester)
    @user = user
    @semester = semester
  end

  def new?
    isAdmin?
  end

  def destroy?
    isAdmin?
  end

  def create?
    isAdmin?
  end

  def semList?
    isAdmin?
  end

  def edit?
    isAdmin?
  end

  def update?
    isAdmin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
