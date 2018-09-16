class Student < ApplicationRecord
  validates :age, presence: true, numericality: {greater_than_or_equal_to: 18, less_than_or_equal_to: 149}
end
