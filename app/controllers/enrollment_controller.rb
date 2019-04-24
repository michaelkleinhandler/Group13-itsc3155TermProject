class EnrollmentController < ApplicationController
  after_action :verify_authorized

  def new
    @enrollment = Enrollment.new
    @user = User.find(params[:user_id])
    authorize @enrollment
  end

  def adminNew
    @enrollment = Enrollment.new
    authorize @enrollment
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @enrollment = @user.enrollments.new(enrollment_params)
    authorize @enrollment
    @enrollment.user_id = @user.id
    if @enrollment.check_allowed == true
      if @enrollment.save
        redirect_to '/myclasses'
      else
        flash[:alert] = "The enrollment cannot be saved"
        render '/enrollment/new'
      end
    elsif @enrollment.check_allowed == "NA"
      redirect_back(fallback_location: root_path)
      flash[:alert] = "You are not authorized to join this course. You are not enrolled at this institution"
    elsif @enrollment.check_allowed == "AE"
      redirect_back(fallback_location: root_path)
      flash[:alert] = "You're already registered for this course OR you've been banned"
    elsif @enrollment.check_allowed == "NF"
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Could not find the course you attemped to register for"
    end



  end

  def destroy
    @project = Course.find(params[:cid])
    authorize @project
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
  end


  def unEnroll
    @project = Course.find(params[:cid])
    authorize @project
    Enrollment.where('enrollments.course_id = ? and enrollments.user_id = ?', params[:cid], params[:sid]).destroy_all
    redirect_to root_path
  end

  def toggleBan
    @project = Course.find(params[:cid])
    authorize @project
    @enrollment = Enrollment.where('enrollments.course_id = ? and enrollments.user_id = ?', params[:cid], params[:sid]).limit(1)
    @enrollment.toggleBanning
    redirect_back(fallback_location: root_path)

  end

  def enrollmentNum
    @project = Course.find(params[:cid])
    @user = User.find(params[:sid])
    Enrollment.enrollmentNum
  end



  private

  def enrollment_params
    params.require(:enrollment).permit([:course_id, :banned, :user_id])
  end

end
