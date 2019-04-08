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
    if (@user.OrgAdmin? and @user.university_id == @record.university_id) or @user.SuperAdmin?
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
    if ((@user.SuperAdmin?) or (@user.OrgAdmin? and @user.university_id == @record.uni_id)) and @user.id != @record.id
      true
    end
  end

  def toggleSuperAdmin?
    if (@user.id != @record.id) and @user.SuperAdmin
      true
    end
  end

  def toggleInstructor?
    mayChange?
  end

  def toggleStudent?
    mayChange?
  end

  def toggleOrgAdmin?
    mayChange?
  end


  def isAdmin?
    (@user.SuperAdmin? and @user.approved?) or (@user.OrgAdmin? and @user.approved)
  end

  def mayChange?
    (@user.SuperAdmin? and @user.approved?) or ((@user.OrgAdmin? and @user.approved) and @user.uni_id == @record.uni_id)
  end

  def teacherPortal?
    true
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
