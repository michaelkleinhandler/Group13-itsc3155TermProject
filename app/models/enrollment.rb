class Enrollment < ApplicationRecord
  before_create :check_unique
  before_create :randomize_id
  belongs_to :course
  belongs_to :user


  def check_unique
    if Enrollment.where('Enrollments.user_id = ? and Enrollments.course_id = ?', self.user_id, self.course_id).presence
      false
  else
    true
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
