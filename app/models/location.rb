class Location < ApplicationRecord
  validates :address, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
