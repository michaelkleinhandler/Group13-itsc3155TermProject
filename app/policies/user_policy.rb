class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def myProfile?
    registered?
  end

  def adminList?
    user.SuperAdmin?
  end

  def adminDash?
    user.SuperAdmin?
  end

  def show?
    user.SuperAdmin?
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
