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
      ActiveRecord::Base.transaction do
        @project.numGroups.times do |n|
          Group.create!(project_id: @project.id, groupNum:n+1, course_id: @course.id)
        end
        end
        redirect_back(fallback_location: root_path)
    else
      flash[:Alert] = "Could not save Project"
      redirect_back(fallback_location: root_path)
      end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @project = @course.projects.find(params[:id])
    @project.destroy
    redirect_to course_path(@course)
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def projectParams
    params.require(:project).permit(:name, :semester_id, :user_id, :course_id, :numGroups)
  end

end
