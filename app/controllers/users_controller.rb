class UsersController < ApplicationController
  after_action :verify_authorized


  def myProfile
    @user = current_user
    authorize @user
  end
end

def user_not_authorized
  flash[:alert] = "You are not authorized to perform this action."
  redirect_to(request.referrer || root_path)
end