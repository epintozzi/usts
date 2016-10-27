class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8}

  has_many :registrations

  enum role: [:default, :admin]
end
