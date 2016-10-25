class Race < ApplicationRecord
  validates :city, :state, presence: true

  has_many :registrations
end
