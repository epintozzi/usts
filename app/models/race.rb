class Race < ApplicationRecord
  validates :city, :state, presence: true

  
end
