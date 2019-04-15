class TeamsController < ApplicationController
  def show
    # @project = Project.find(params[:project_id])
    @team = Team.find(params[:id])
  end
end
