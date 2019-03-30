class AdminController < ApplicationController
  after_action :verify_authorized


  def adminList
    authorize current_user
    @users = User.all
  end

  def adminDash
    authorize current_user
  end


end
