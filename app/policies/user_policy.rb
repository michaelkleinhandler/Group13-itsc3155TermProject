class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def myProfile?
    registered?
  end

  def adminList?
    registered?
  end

  def show?
    registered?
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
