class BoatClass < ApplicationRecord
  validates :class_name, presence: true
  validates :class_name, uniqueness: true

  has_many :registrations
  has_many :users, through: :registrations 
end
