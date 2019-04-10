class CoursesController < ApplicationController
  after_action :verify_authorized


  def show
    authorize Course
    @course = Course.find(params[:id])
  end




  def myclasses
    authorize Course
    @user = current_user
    @courses = @user.getClasses
  end

  def new
    authorize Course
    @course = Course.new
    @user = current_user
    @semesters = Semester.find_by_university_id(@user.university_id)
  end

  def create
    authorize Course
    @user = current_user
    @course = Course.new(course_params)
    @course.teacher = current_user.id
    @course.uni_id = current_user.university_id
    if @course.save
      redirect_to '/teacherportal'
    else
      render 'courses/new'
    end
  end

  def index
    authorize Course
    @course = Course.all
  end

  def edit
    @course = Course.find(params[:id])
    authorize @course
  end

  def update
    @course = Course.find(params[:id])
    authorize @course

    if @course.update(course_params)
      redirect_to('/teacherportal')
    else
      render 'edit'
    end
  end

 def destroy
   @course = Course.find(params[:id])
   authorize @course
   @course.destroy
   redirect_to '/teacherportal'
 end


  def teacherPortal
    authorize current_user
    @user = current_user
    @courses = Course.where(:teacher => @user.id)
  end

  # def toggleBan
  #   @course = Course.find(params[:Cid])
  #   authorize @course
  #   @user = User.find(params[:Sid])
  #   Enrollment.banStudent(@course, @user)
  #   redirect_back(fallback_location: root_path)
  # end






  private

  def course_params
    params.require(:course).permit([:title, :semester_id, :year, :subject, :section, :teacher, :coursenum, :uni_id, :User_id, :course_id])
  end

end
