class SemestersController < ApplicationController

  def new
    @semester = Semester.new
    semList
  end


  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      redirect_to '/admin'
    else
      render 'new'
    end
  end

  def semList
    @semesters = Semester.all

  end




  private

  def semester_params
    params.require(:semester).permit([:name, :beginDate, :endDate, :university_id])
  end

end
