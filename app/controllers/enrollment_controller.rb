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
    if @enrollment.check_unique
      if @enrollment.save
        redirect_to '/myclasses'
      else
        flash[:alert] = "The course you have requested cannot be found or enrollment for it has been disabled"
        render '/enrollment/new'
      end
    else
      redirect_to '/enrollme'
      flash[:alert] = "You're already registered for this course OR you've been banned"
    end
  end

  def destroy
    @course = Course.find(params[:cid])
    authorize @course
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
  end


  def unEnroll
    @course = Course.find(params[:cid])
    authorize @course
    Enrollment.where('enrollments.course_id = ? and enrollments.user_id = ?', params[:cid], params[:sid]).destroy_all
    redirect_to root_path
  end

  def toggleBan
    @course = Course.find(params[:cid])
    authorize @course
    @enrollment = Enrollment.where('enrollments.course_id = ? and enrollments.user_id = ?', params[:cid], params[:sid]).limit(1)
    @enrollment.toggleBanning
    redirect_back(fallback_location: root_path)

  end

  def enrollmentNum
    @course = Course.find(params[:cid])
    @user = User.find(params[:sid])
    Enrollment.enrollmentNum
  end



  private

  def enrollment_params
    params.require(:enrollment).permit([:course_id, :banned])
  end

end
