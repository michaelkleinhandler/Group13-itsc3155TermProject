class GroupMembershipsController < ApplicationController

  def new
    @user = current_user
    @group = Group.find(params[:id])
  end

  def create

  end
end
