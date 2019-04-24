class TeamMembershipsController < ApplicationController
  after_action :verify_authorized

  def joinGroup
    @team = Team.find(params[:team_id])
    @team_membership = @team.team_memberships.create
    @team_membership.user_id = current_user.id
    @team_membership.team_id = @team.id
    @team_membership.project_id = @team.project_id
    @team_membership.course_id = @team.course_id
    authorize @team_membership
    if @team_membership.check_unique
      if @team_membership.save
        redirect_to project_path(@team_membership.team.project_id)
      else
        redirect_to project_path(@team_membership.team.project_id)
        flash[:alert] = "Could not join group"
      end
    else
      redirect_to project_path(@team_membership.project_id)
      flash[:alert] = "You're already registered for this group"
    end
  end
end
