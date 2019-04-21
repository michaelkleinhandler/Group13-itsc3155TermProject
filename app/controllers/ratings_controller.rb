class RatingsController < ApplicationController
  after_action :verify_authorized

  def new
    @team_membership = TeamMembership.find(params[:team_membership_id])
    @user = User.find(@team_membership.user_id)
    @rating = @team_membership.ratings.new
    authorize @rating
  end

  def create
    @team_membership = TeamMembership.find(params[:team_membership_id])
    @project = Project.find(@team_membership.project_id)
    @rating = Rating.new(ratingParams)
    @rating.team_id = @team_membership.team_id
    @rating.project_id = @team_membership.project_id
    @rating.created_by = current_user.id
    @rating.user_id = @team_membership.user_id
    @rating.course_id = @project.course_id
    authorize @rating
    if @rating.check_unique
      if @rating.save
        redirect_to project_path(@project)
      else
        redirect_to new_team_membership_rating_path(@team_membership)
      end
    else
      redirect_to project_path(@project)
      flash[:alert] = "You've already rated this user"
    end
  end

  private

  def ratingParams
    params.require(:rating).permit(:team_id, :user_id, :project_id, :rating, :created_by)
  end


end
