class CoursePolicy
  attr_reader :user, :record

  def initialize(user,course)
    @user = user
    @course = course
  end

  def enrollme?
    true
  end
  
  def myclasses?
    true
  end

  def index?
    registered?
  end

  def show?
    @user.SuperAdmin?
  end

  def new?
    @user.Instructor?
  end

  def create?
    @user.Instructor?
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