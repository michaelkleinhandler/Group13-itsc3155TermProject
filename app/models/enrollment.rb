class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user


  # def check_unique
  #   if Enrollment.where('Enrollments.user_id = ? and Enrollments.course_id = ?', self.user_id, self.course_id).present?
  #     false
  #   end
  # end
end
