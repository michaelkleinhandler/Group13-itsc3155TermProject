class SemestersController < ApplicationController



  private

  def semester_params
    params.require(:user).permit([:firstName, :lastName, :email, :password, :Instructor, :SuperAdmin, :OrgAdmin, :Student, :approved, :uni_id])
  end

end
