class TeacherController < UsersController

  def teacherPortal
    authorize current_user
    @courses = Course.all
    # @courses = Course.find_by(teacher: current_user.UserID)
  end




end
