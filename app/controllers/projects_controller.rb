class ProjectsController < ApplicationController
  #
  # def new
  #   @project = Project.new
  # end

  def create
    @course = Course.find(params[:course_id])
    @project = @course.projects.create(projectParams)
    @user = current_user
    @project.user_id = @user.id
    @project.semester_id = @course.semester_id
    if @project.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Could not save Project"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def projectParams
    params.require(:project).permit(:name, :semester_id, :user_id, :course_id)
  end

end
