class University < ApplicationRecord
  before_save :set_uni_id
  has_many :user, foreign_key: :uni_id
  has_many :semesters, foreign_key: :uni_id

  def set_uni_id
    self.uni_id = rand (1000000..9999999)
  end




end
