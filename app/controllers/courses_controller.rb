class CoursesController < ApplicationController
  after_action :verify_authorized


  # Shows the information of the course
  def show
    @course = Course.find(params[:id])
    @user = current_user
    authorize @course
  end

  # Generates the classes for a specific user
  def myclasses
    authorize Course
    @user = current_user
    @courses = @user.getClasses
  end

  # Generates a new course
  def new
    authorize Course
    @course = Course.new
    @user = current_user
    @semesters = Semester.find_by_university_id(@user.university_id)
  end

  # Creates a course. This allows for more information to be added to the course such as teacher and university ID
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

  # Generates the index for all the course
  def index
    authorize Course
    @course = Course.all
  end

  # Allows you to edit the course
  def edit
    @course = Course.find(params[:id])
    authorize @course
  end

  # Allows you to update the course
  def update
    @course = Course.find(params[:id])
    authorize @course

    if @course.update(course_params)
      redirect_to('/teacherportal')
    else
      render 'edit'
    end
  end

  # Allows you to delete the course
 def destroy
   @course = Course.find(params[:id])
   authorize @course
   @course.destroy
   redirect_to '/teacherportal'
 end


  # Generates the portal that displays all the current, future, and past courses and information detailing
  # student information of their current classes
  def teacherPortal
    authorize current_user
    @user = current_user
    # @courses = Course.where(:teacher => @user.id)
    @courses = Course.joins(:semester).where('(? between semesters.beginDate and semesters.endDate) and courses.teacher = ?', Date.today, @user.id)
    @future_courses = Course.joins(:semester).where('(? < semesters.beginDate) and courses.teacher = ?', Date.today, @user.id)
    @past_courses = Course.joins(:semester).where('(? > semesters.endDate) and courses.teacher = ?', Date.today, @user.id)
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
