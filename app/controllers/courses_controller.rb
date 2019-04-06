class CoursesController < ApplicationController
  include Pundit
  after_action :verify_authorized


  def show
    authorize current_user
    @course = Course.find(params[:id])
  end

  def enrollme
    @user = current_user
    authorize Course
  end

  def myclasses
    @user = current_user
    authorize Course
  end

  def new
    authorize Course
    @course = Course.new
  end

  def create
    authorize Course
    @course = Course.new(course_params)
    @course.teacher = current_user.UserID
    if @course.save
      redirect_to @course
    else
      render 'newCourse'
    end
  end

  def index
    authorize Course
    @course = Course.all
  end

  def edit
    authorize Course
    @course = Course.find(params[:id])
  end

  def update
    authorize Course
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course

    else
      render 'edit'
    end
  end

 def destroy
   authorize Course
   @course = Course.find(params[:id])
   @course.destroy
   redirect_to root_path
 end



  private

  def course_params
    params.require(:course).permit([:title, :semester, :year, :subject, :courses, :section, :teacher, :coursenum])
  end

end
