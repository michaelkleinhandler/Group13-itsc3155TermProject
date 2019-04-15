class SemestersController < ApplicationController

  #Generates a new semester
  def new
    @user = current_user
    @semester = Semester.new
    semList
  end

  # Creates the new semester and fills in the information needed
  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  # Generates the list of all the possible semesters
  def semList
    @semesters = Semester.all
  end

  # Allows user to edit the specific semester
  def edit
    @semester = Semester.find(params[:id])
  end

  # Allows the user to update the semester information
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
