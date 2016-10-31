class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8}

  has_many :registrations
  has_many :boat_classes, through: :registrations

  enum role: [:default, :admin]

  def boat_class_string
    boat_classes.map(&:class_name).uniq.join(", ")
  end
end
