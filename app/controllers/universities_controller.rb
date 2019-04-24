class UniversitiesController < ApplicationController

  # Generates a new university
  def new
    @university = University.new
    @universities = University.all
  end

  # Creates and populates the university with the information given
  def create
    @university = University.new(university_params)
    if @university.save
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  # Generates a list of all the created universities
  def show
    @universities = University.all
  end


  private

  def university_params
    params.require(:university).permit(:uniName, :id)
  end

end
