class Semester < ApplicationRecord
  belongs_to :university, foreign_key: :uni_id
end
