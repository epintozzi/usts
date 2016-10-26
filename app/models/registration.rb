class Registration < ApplicationRecord
  validates :race_id, :boat_class_id, presence: true

  belongs_to :race
  # belongs_to :user
  belongs_to :boat_class
end
