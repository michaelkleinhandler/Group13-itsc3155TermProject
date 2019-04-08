class EnrollmentController < ApplicationController
  after_action :verify_authorized

  def new
    authorize Enrollment
    @enrollment = Enrollment.new
    @user = current_user
  end

  def create
    authorize Enrollment
    @user = current_user
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.user_id = @user.id
    # if @enrollment.check_unique
      if @enrollment.save
        redirect_to '/myclasses'
      else
        flash[:alert] = "The course you have requested cannot be found or enrollment for it has been disabled"
        render '/enrollment/new'
      end
    # else
    # end
  end

  def destroy
    @enrollment = Enrollment.find_by_course_id(@course.course_id)
    authorize @enrollment
    @enrollment.destroy
    redirect_to root_path
  end


  private

  def enrollment_params
    params.require(:enrollment).permit([:course_id])
  end

end
