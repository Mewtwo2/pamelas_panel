class Instructor < ApplicationRecord
  validates :age, presence: true, numericality: {greater_than_or_equal_to: 18, less_than_or_equal_to: 149}
  validates :salary, presence:true, numericality: {greater_than_or_equal_to: 100000, less_than_or_equal_to: 1000000}
end
