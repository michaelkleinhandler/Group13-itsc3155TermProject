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
    @course = Course.find(params[:Cid])
    authorize @course
    @enrollment = Enrollment.where(:course_id => :Cid, :user_id => :Uid)
    Enrollment.destroy(Enrollment.where(:course_id => :Cid, :user_id => :Uid))

    redirect_to root_path
  end



  private

  def enrollment_params
    params.require(:enrollment).permit([:course_id, :banned])
  end

end
