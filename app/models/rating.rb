class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :team_membership
  # before_create :check_unique

  #
  # def check_unique
  #   if Enrollment.where('Enrollments.user_id = ? and Enrollments.course_id = ?', self.user_id, self.course_id).presence
  #     false
  #   else
  #     true
  #   end
  # end
  #


end
