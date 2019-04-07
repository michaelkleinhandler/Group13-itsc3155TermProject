class Teacher < ApplicationRecord

  def semName
    Semester.find_by_semester_id(self.semester_id).name
  end

end
