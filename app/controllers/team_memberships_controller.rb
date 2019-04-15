class TeamMembershipsController < ApplicationController

  def create
    @team = Team.find(params[:team_id])
    @team_membership = @team.team_memberships.create
    @team_membership.user_id = current_user.id
    @team_membership.team_id = @team.id
    if @team_membership.check_unique
      if @team_membership.save
        redirect_to project_team_path(@team_membership.team.project_id, @team_membership.team_id)
      else
        render project_path(@team_membership.team.project_id)
      end
    else
      redirect_to project_path(@team_membership.team.project_id)
      flash[:alert] = "You're already registered for this group"
    end
  end
end
