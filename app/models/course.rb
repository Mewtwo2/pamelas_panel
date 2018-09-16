class Course < ApplicationRecord
  validates :class_hours, presence: true, numericality: {greater_than_or_equal_to: 20}
end
