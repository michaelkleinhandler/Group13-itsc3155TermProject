class AdminPolicy < ApplicationPolicy
  attr_reader :user, :record

  def adminList?
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
