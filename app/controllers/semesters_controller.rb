class SemestersController < ApplicationController

  def new
    @user = current_user
    @semester = Semester.new
    semList
  end


  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  def semList
    @semesters = Semester.all
  end

  def edit
    @semester = Semester.find(params[:id])
  end

  def update
    @semester = Semester.find(params[:id])
    # authorize @semester
    if @semester.update(semester_params)
      redirect_back(fallback_location: root_path)
    else
      render 'edit'
    end
  end




  private

  def semester_params
    params.require(:semester).permit([:name, :beginDate, :endDate, :university_id])
  end

end
