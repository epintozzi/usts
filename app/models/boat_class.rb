class BoatClass < ApplicationRecord
  validates :class_name, presence: true
  validates :class_name, uniqueness: true
end
