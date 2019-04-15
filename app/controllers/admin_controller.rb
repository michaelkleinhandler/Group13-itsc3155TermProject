class AdminController < ApplicationController
  after_action :verify_authorized

  # Generates the list of admins
  def adminList
    authorize current_user
    @users = User.all
  end

  # Generates the dashboard for the admin
  def adminDash
    authorize current_user
  end

  private

  def user_params
  params.permit(:email)
  end


end
