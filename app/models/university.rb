class University < ApplicationRecord
  before_save :set_uni_id

  def set_uni_id
    self.uniID = rand (1000000..9999999)
  end
end
