class UsersController < ApplicationController
  after_action :verify_authorized


  def show
    @checkFor = current_user
    authorize @checkFor
    @user = User.find(params[:id])
  end

  def myProfile
    @user = current_user
    @checkFor = current_user
    authorize @checkFor
  end

  def edit
    authorize current_user
    @user = User.find(current_user.id)
  end

  def adminEdit
    authorize User.find(params[:id])
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
      redirect_to(root_path)
    else
      render '/users/registrations/edit'
    end
  end

  def toggleApproved
    authorize current_user
    @user = User.find(params[:id])
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university == @user.university)
      if @user.approved
        @user.approved = false
      elsif not @user.approved
        @user.approved = true
      end
      @user.save
      redirect_to '/admin/userlist'
    end
  end

  def toggleSuperAdmin
    authorize User.find(params[:id])
    @user = User.find(params[:id])
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university == @user.university)
      if @user.SuperAdmin and (current_user.UserID != @user.UserID)
        @user.SuperAdmin = false
      elsif not @user.SuperAdmin
        @user.SuperAdmin = true
      end
      @user.save
      redirect_to '/admin/userlist'
    end
  end

  private

  def user_params
    params.require(:user).permit([:firstName, :lastName, :email, :password, :Instructor, :SuperAdmin, :OrgAdmin, :Student, :approved, :uni_id])
  end


end
