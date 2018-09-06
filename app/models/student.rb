class Student < ApplicationRecord
  validates :age, presence: true, length: { maximum: 149 }
end
