class TeamMembershipsController < ApplicationController

  def create
    @team = Team.find(params[:team_id])
    @team_membership = @team.team_memberships.create
    @team_membership.user_id = current_user.id
    @team_membership.team_id = @team.id
    if @team_membership.save
      redirect_to team_path(@team)
    else
      flash[:Alert] = "Could not save Project"
      redirect_back(fallback_location: root_path)
    end
  end

end
