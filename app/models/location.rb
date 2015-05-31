class Location < ActiveRecord::Base
  validates :latitude, :longitude, presence: true
end
