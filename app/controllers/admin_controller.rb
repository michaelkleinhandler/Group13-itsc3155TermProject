class AdminController < ApplicationController
  after_action :verify_authorized


  def adminList
    @checkFor = current_user
    authorize @checkFor
    @users = User.all
  end


end
