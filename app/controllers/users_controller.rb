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
      render '/users/adminEdit'
    end
  end

  def update
    authorize current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      if current_user.SuperAdmin? or current_user.OrgAdmin?
        redirect_to '/admin/userlist'
      else
        redirect_to(root_path)
      end
    else
        render '/users/registrations/edit'
    end
  end

  def toggleApproved
    authorize current_user
    @user = User.find(params[:id])
    # if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university == @user.university)
      if @user.approved
        @user.approved = false
      elsif not @user.approved
        @user.approved = true
      end
      @user.save
      redirect_to '/admin/userlist'
    # end
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

  def toggleInstructor
    authorize User.find(params[:id])
    @user = User.find(params[:id])
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university == @user.university)
      if @user.Instructor?
        @user.Instructor = false
      elsif not @user.Instructor?
        @user.Instructor = true
      end
      @user.save
      redirect_to '/admin/userlist'
    end
  end

  def toggleStudent
    authorize User.find(params[:id])
    @user = User.find(params[:id])
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university == @user.university)
      if @user.Student?
        @user.Student = false
      elsif not @user.Student?
        @user.Student = true
      end
      @user.save
      redirect_to '/admin/userlist'
    end
  end

  def toggleOrgAdmin
    authorize User.find(params[:id])
    @user = User.find(params[:id])
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university == @user.university)
      if @user.OrgAdmin?
        @user.OrgAdmin = false
      elsif not @user.OrgAdmin?
        @user.OrgAdmin = true
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
