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
    @enrollment = @user.enrollments.new(enrollment_params)
    @enrollment.user_id = @user.id
    if @enrollment.check_allowed == true
      if @enrollment.save
        redirect_to '/myclasses'
      else
        flash[:alert] = "The enrollment cannot be saved"
        render '/enrollment/new'
      end
    elsif @enrollment.check_allowed == "NA"
      redirect_to '/enrollme'
      flash[:alert] = "You are not authorized to join this course. You are not enrolled at this institution"
    elsif @enrollment.check_allowed == "AE"
      redirect_to '/enrollme'
      flash[:alert] = "You're already registered for this course OR you've been banned"
    elsif @enrollment.check_allowed == "NF"
      redirect_to '/enrollme'
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
    params.require(:enrollment).permit([:course_id, :banned])
  end

end
