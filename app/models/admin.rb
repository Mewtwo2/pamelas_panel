class Admin < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
end
