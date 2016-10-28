class Race < ApplicationRecord
  validates :city, :state, :start_date, :end_date, presence: true

  has_many :registrations
end
