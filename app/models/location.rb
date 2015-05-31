class Location < ActiveRecord::Base
  belongs_to :person

  validates :latitude, :longitude, presence: true
end
