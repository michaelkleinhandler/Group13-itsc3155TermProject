class ProjectPolicy < ApplicationPolicy
  def initialize(user,project)
    @user = user
    @project = project
  end

  def show?
    if
    (Date.today <= @project.dueDate and Date.today >= @project.availableDate) or (@project.course.teacher == @user.id)
      true
    end
  end

  def edit?
    if @project.course.teacher == @user.id
      true
    end
  end

  def update?
    if @project.course.teacher == @user.id
      true
    end
  end

  def destroy?
    if @project.course.teacher == @user.id
      true
    end
  end

  def create?
    if @project.course.teacher == @user.id
      true
    end
  end

  def new?
    if @project.course.teacher == @user.id
      true
    end
  end

  def destroy?
    if @project.user_id == @user.id
      true
    end
  end





  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
