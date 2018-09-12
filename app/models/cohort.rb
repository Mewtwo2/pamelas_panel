class Cohort < ApplicationRecord
  validates :student_ids, length: {maximum: 10}
end
