class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    false
  end

  def update?
    false
  end

  def edit?
    false
  end

  def destroy?
    false
  end

  def registered?
    (user.SuperAdmin? or user.Instructor? or user.Student?) and user.approved?
  end

  def adminUpdate?
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
