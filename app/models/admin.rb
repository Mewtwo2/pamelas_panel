class Admin < ApplicationRecord
  before_save {self.username = username.downcase}
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: {minimum: 8,maximum:20}
  validates :admin_key, presence: true, length: {is: 6}, numericality: {only_integer: true}

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
