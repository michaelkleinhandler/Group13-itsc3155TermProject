class ProjectsController < ApplicationController
  after_action :verify_authorized

  #
  def new
    @course = Course.find(params[:course_id])
    @project = @course.projects.new
    authorize @project
  end

  # Creates a project and fills in the information needed such as the creator of the project, the course it's for,
  # and the semester
  def create
    @course = Course.find(params[:course_id])
    @project = @course.projects.create(projectParams)
    authorize @project
    @user = current_user
    @project.user_id = @user.id
    @project.semester_id = @project.semester_id
    if @project.save
      ActiveRecord::Base.transaction do
        @project.numGroups.times do |n|
          Team.create!(project_id: @project.id, groupNum:n+1, course_id: @project.course_id)
        end
        end
        redirect_to course_path(@course)
    else
      flash[:Alert] = "Could not save Project"
      redirect_back(fallback_location: root_path)
      end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @project = @course.projects.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to course_path(@course)
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def edit
    @course = Course.find(params[:course_id])
    @project = @course.projects.find(params[:id])
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    if @project.update(projectParams)
      redirect_to course_path(@project.course_id)
    else
      render 'edit'
    end
  end



  private

  def projectParams
    params.require(:project).permit(:name, :semester_id, :user_id, :course_id, :numGroups, :availableDate, :dueDate)
  end

end
