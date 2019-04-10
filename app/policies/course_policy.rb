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
    user
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

  def edit?
    if (@user.id == @course.teacher) or ((@user.university_id == @course.uni_id) and @user.OrgAdmin?) or @user.SuperAdmin?
      true
    end
  end

  def update?
    if (@user.id == @course.teacher) or ((@user.university_id == @course.uni_id) and @user.OrgAdmin?) or @user.SuperAdmin?
      true
    end
  end

  def destroy?
    if (@user.id == @course.teacher) or ((@user.university_id == @course.uni_id) and @user.OrgAdmin?) or @user.SuperAdmin?
      true
    end
  end

  def toggleBan?
    if @user.id == @course.teacher
      true
    end
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