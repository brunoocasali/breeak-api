class LocationSerializer < ActiveModel::Serializer
  cache key: 'location', expires_in: 3.hours
  attributes :id, :longitude, :latitude

  belongs_to :person

  url :location
end
