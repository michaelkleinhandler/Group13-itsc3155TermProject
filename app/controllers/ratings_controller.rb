class RatingsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @team = Team.find(params[:team_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(ratingParams)
    @rating.save

  end

  private

  def ratingParams
    params.require(:rating).permit(:team_id, :user_id, :project_id, :rating, :created_by)
  end


end
