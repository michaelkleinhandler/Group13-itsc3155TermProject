class UniversitiesController < ApplicationController
  def new
    @university = University.new
    @universities = University.all
  end

  def create
    @university = University.new(university_params)
    if @university.save
      redirect_to '/admin'
    else
      render 'new'
    end
  end

  def uniList
    @universities = University.all
  end

  private

  def university_params
    params.require(:university).permit(:uniName)
  end

end
