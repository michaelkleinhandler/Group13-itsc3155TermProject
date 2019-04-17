class TeamsController < ApplicationController
  def show
    # @project = Project.find(params[:project_id])
    @team = Team.find(params[:id])
    @team_memberships = TeamMembership.find_by_team_id(@team.id)
    @project = Project.find(@team.project_id)
  end
end
