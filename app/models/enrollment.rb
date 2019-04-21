class Enrollment < ApplicationRecord
  before_create :check_allowed
  before_create :randomize_id
  belongs_to :course
  belongs_to :user

  # Checks to make sure that the id
  def check_allowed
    if Course.where('courses.id = ?', self.course_id).present?
      if Enrollment.where('Enrollments.user_id = ? and Enrollments.course_id = ?', self.user_id, self.course_id).presence
        "AE"
      elsif Course.find(self.course_id).uni_id != self.user.university_id
        "NA"
      else
        true
      end
    else
      "NF"
    end
  end

  def self.toggleBanning
    @enrollment = self.first
    if @enrollment.banned?
      @enrollment.banned = false
    elsif not @enrollment.banned?
      @enrollment.banned = true
    end
    @enrollment.save
  end

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Enrollment.where(id: self.id).exists?
  end

end
