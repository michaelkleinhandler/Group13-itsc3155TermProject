class TeacherPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index
    false
  end

  def new
    registered?
  end

  def show?
    registered?
  end

  def create?
    registered?
  end

end