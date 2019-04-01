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

  def edit
    authorize current_user
    @user = User.find(current_user.id)
  end

  def adminEdit
    authorize current_user
    @user = User.find(params[:id])
  end


  def adminUpdate
    authorize current_user
    @user = User.find(params[:id])
    if @user.update(adUser_params)
      redirect_to '/admin'
    else
      render 'adminEdit'
    end
  end

  def update
    authorize current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render '/users/registrations/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :Instructor, :SuperAdmin, :OrgAdmin, :Student, :Approved)
  end


end
