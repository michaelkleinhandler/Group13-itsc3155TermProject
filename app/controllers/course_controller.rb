class CourseController < ApplicationController
  before_save :gen_course_ID

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def index
    @course = Course.all
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course

    else
      render 'edit'
    end
  end

 def destroy
   @course = Course.find(params[:id])
   @course.destroy

   redirect_to root_path
 end

  def gen_course_ID
    self.randID = rand (1000000..9999999)

  end


  private
  def course_params
    params.require(:title).require(:teacher).require(:semester).require(:year).require(:subject).require(:course).require(:section)
  end

end
