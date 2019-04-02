class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def myProfile?
    registered?
  end

  def adminList?
    isAdmin?
  end

  def adminDash?
    isAdmin?
  end

  def show?
    isAdmin?
  end

  def edit?
    isAdmin?
  end

  def adminUpdate?
    isAdmin?
  end

  def adminEdit?
    if (@user.OrgAdmin? and @user.university == @record.university) or @user.SuperAdmin?
      true
    end
  end

  def update?
    registered?
  end

  def new?
    registered?
  end

  def toggleApproved?
    user.SuperAdmin?
  end

  def isAdmin?
    (user.SuperAdmin? and user.approved?) or (user.OrgAdmin? and user.approved)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
