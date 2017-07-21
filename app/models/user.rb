class User < ApplicationRecord
  has_many :goals
  has_secure_password
  validates :email, presence: true
end
