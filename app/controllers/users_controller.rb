class UsersController < ApplicationController
  after_action :verify_authorized

  def show
    @checkFor = current_user
    authorize @checkFor
    @user = User.find(params[:id])
  end

  def myProfile
    @user = current_user
    authorize @user
  end

end
