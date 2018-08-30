class Course < ApplicationRecord
  validates :class_hours, presence: true, length: {minimum:20}
end
