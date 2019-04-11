class UsersController < ApplicationController
  after_action :verify_authorized


  def show
    @checkFor = current_user
    authorize @checkFor
    @user = User.find(params[:id])
  end

  def myProfile
    @checkFor = current_user
    authorize @checkFor
    @user = current_user
    # @courses = @user.courses.all
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
    @user = User.find(params[:id])
    authorize @user
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
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university_id == @user.university_id)
      if @user.SuperAdmin and (current_user.id != @user.id)
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
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university_id == @user.university_id)
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
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university_id == @user.university_id)
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
    if current_user.SuperAdmin? or (current_user.OrgAdmin? and current_user.university_id == @user.university_id)
      if @user.OrgAdmin?
        @user.OrgAdmin = false
      elsif not @user.OrgAdmin?
        @user.OrgAdmin = true
      end
      @user.save
      redirect_to '/admin/userlist'
    end
  end

  def passwordReset
    @user = User.find(params[:id])
    authorize @user
  end

  def enrollmentNum
    @user = User.find(params[:id])
    @course = Course.find(params[:cid])
    @user.enrollmentNum
  end

  private

  def user_params
    params.require(:user).permit([:id, :firstName, :lastName, :email, :password, :Instructor, :SuperAdmin, :OrgAdmin, :Student, :approved, :university_id])
  end


end
