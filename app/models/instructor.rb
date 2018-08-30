class Instructor < ApplicationRecord
  validates :age, presence: true, length: {maximum: 149}
  validates :salary, presence:true, length: {minimum: 100000}
end
