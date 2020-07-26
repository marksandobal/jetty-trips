class Trip < ApplicationRecord
  has_many :trip_stops
  belongs_to :driver
end

